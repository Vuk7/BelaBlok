import 'package:flutter/material.dart';
import 'package:bela_blok/models/playing_card.dart';
import 'package:bela_blok/services/card_calculator_service.dart';
import 'package:bela_blok/themes/app_theme.dart';
import 'package:bela_blok/enums/smart_calculator_enum.dart' show CardSuit, CardRank; 

class SmartCalculatorScreen extends StatefulWidget {
  final Map<String, dynamic>? initialResult;

  const SmartCalculatorScreen({super.key, this.initialResult}); 

  @override
  State<SmartCalculatorScreen> createState() => _SmartCalculatorScreenState();
}

class _SmartCalculatorScreenState extends State<SmartCalculatorScreen> {
  final CardCalculatorService _calculatorService = CardCalculatorService();

  List<PlayingCard> _allCards = [];
  List<PlayingCard> _filteredCards = [];
  late final List<PlayingCard> _selectedCards = <PlayingCard>[];

  late final List<CardSuit> _selectedSuits = <CardSuit>[]; 
  final CardSuit _trumpSuit = CardSuit.herc;
  late final List<String> _trumpCards = <String>[];

  String _selectedTeam = 'mi';

  int _currentScore = 0;

  @override
  void initState() {
    super.initState();
    _initializeCards();
    if (widget.initialResult != null) {
      _restoreCalculatorState(widget.initialResult!);
    }
  }

  void _restoreCalculatorState(Map<String, dynamic> result) {
    _selectedTeam = result['team'] ?? 'mi';
    _currentScore = result['score'] ?? 0;
    final cardIds = (result['cards'] as List?)?.cast<String>() ?? [];
    final trumpCardIds = (result['trumpCards'] as List?)?.cast<String>() ?? [];
    _selectedCards.clear();
    _trumpCards.clear();
    for (final card in _allCards) {
      if (cardIds.contains(card.id)) {
        _selectedCards.add(card);
        if (trumpCardIds.contains(card.id)) {
          _trumpCards.add(card.id);
        }
      }
    }
    _calculateScore();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initializeCards() {
    _allCards = _calculatorService.generateAllCards();
    _selectedSuits.clear();
    _selectedSuits.addAll(CardSuit.values);
    _updateFilteredCards();
  }

  void _updateFilteredCards() {
    _filteredCards = _calculatorService.filterCardsBySuits(_allCards, _selectedSuits);
    _calculateScore();
  }

  void _calculateScore() {
    _currentScore = _calculatorService.calculateTotalScore(
      _selectedCards,
      _trumpSuit,
      _trumpCards,
    );
    setState(() {});
  }

  void _toggleCardSelection(PlayingCard card) {
    setState(() {
      if (_selectedCards.contains(card)) {
        _selectedCards.remove(card);
        _trumpCards.remove(card.id);
      } else {
        _selectedCards.add(card);
      }
      _calculateScore();
    });
  }

  void _toggleTrumpCard(PlayingCard card) {
    setState(() {
      if (!_selectedCards.contains(card) || !(card.rank == CardRank.nine || card.rank == CardRank.jack)) {
        return;
      }

      if (_trumpCards.contains(card.id)) {
        _trumpCards.remove(card.id);
      } else {
       
        final currentSuit = card.suit;
        final adutIdsInOtherSuits = _trumpCards.where((id) {
          final parts = id.split('_');
          return parts.length == 2 && parts[1] != currentSuit.name && (parts[0] == '9' || parts[0] == 'J');
        }).toList();

      
        for (final id in adutIdsInOtherSuits) {
          _trumpCards.remove(id);
        }

        
        _trumpCards.add(card.id);
      }
      _calculateScore();
    });
  }

  void _toggleSuitFilter(CardSuit suit) {
    setState(() {
      if (_selectedSuits.contains(suit)) {
        _selectedSuits.remove(suit);
      } else {
        _selectedSuits.add(suit);
      }
      if (_selectedSuits.isEmpty) {
        _selectedSuits.addAll(CardSuit.values);
      }
      _updateFilteredCards();
    });
  }

  void _resetSelection() {
    setState(() {
      _selectedCards.clear();
      _trumpCards.clear();
      _calculateScore();
    });
  }

  void _confirmScore() {
    Navigator.of(context).pop({
      'score': _currentScore,
      'team': _selectedTeam,
      'cards': _selectedCards.map((c) => c.id).toList(),
      'trumpCards': _trumpCards,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF2C3E50)
          : const Color(0xFFF5E6D3),
      appBar: AppBar(
        title: const Text('Pomoć kod računanja'),
        backgroundColor: AppTheme.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetSelection,
            tooltip: 'Resetiraj odabir',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTeamSelection(),
                    _buildSuitFilter(),
                    _buildCardsGrid(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamSelection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Text(
            'Tim:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('MI', style: TextStyle(fontSize: 14)),
                    value: 'mi',
                    groupValue: _selectedTeam,
                    onChanged: (value) {
                      setState(() {
                        _selectedTeam = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('VI', style: TextStyle(fontSize: 14)),
                    value: 'vi',
                    groupValue: _selectedTeam,
                    onChanged: (value) {
                      setState(() {
                        _selectedTeam = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuitFilter() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Prikaži karte:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap = odabir karte • Long press = označavanje kao adut',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              FilterChip(
                label: const Text('Sve'),
                selected: _selectedSuits.length == CardSuit.values.length,
                onSelected: (selected) {
                  setState(() {
                    _selectedSuits.clear();
                    _selectedSuits.addAll(CardSuit.values);
                    _updateFilteredCards();
                  });
                },
                selectedColor: AppTheme.green.withAlpha(80),
                checkmarkColor: AppTheme.green,
              ),
              ...CardCalculatorService.suits.map((suit) {
                return FilterChip(
                  label: Text(_calculatorService.getSuitDisplayName(suit)),
                  selected: _selectedSuits.contains(suit),
                  onSelected: (selected) => _toggleSuitFilter(suit),
                  selectedColor: AppTheme.green.withAlpha(80),
                  checkmarkColor: AppTheme.green,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardsGrid() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: _filteredCards.length,
        itemBuilder: (context, index) {
          final card = _filteredCards[index];
          final isSelected = _selectedCards.contains(card);
          final isTrump = _trumpCards.contains(card.id);
          final cardValue = card.getValue(isTrump);

          return GestureDetector(
            onTap: () => _toggleCardSelection(card),
            onLongPress: (card.rank == CardRank.nine || card.rank == CardRank.jack) ? () => _toggleTrumpCard(card) : null,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? AppTheme.green : Colors.grey,
                  width: isSelected ? 3 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: isSelected
                    ? AppTheme.green.withValues(alpha: 0.1)
                    : isTrump
                        ? Colors.orange.withValues(alpha: 0.2)
                        : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          '${card.rank.label}\n${_getSuitSymbol(card.suit)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _getSuitColor(card.suit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: isTrump ? Colors.orange : Colors.blue,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      isTrump ? 'ADUT $cardValue' : '$cardValue',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: _selectedCards.isNotEmpty ? _confirmScore : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'POTVRDI REZULTAT ($_currentScore bodova za ${_selectedTeam.toUpperCase()})',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  String _getSuitSymbol(CardSuit suit) {
    switch (suit) {
      case CardSuit.herc:
        return '♥';
      case CardSuit.karo:
        return '♦';
      case CardSuit.tref:
        return '♣';
      case CardSuit.pik:
        return '♠';
      
    }
  }

  Color _getSuitColor(CardSuit suit) {
    switch (suit) {
      case CardSuit.herc:
      case CardSuit.karo:
        return Colors.red;
      case CardSuit.tref:
      case CardSuit.pik:
        return Colors.black;
      
    }
  }
}