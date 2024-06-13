import 'package:flutter/material.dart';
import 'package:madarkharj/services/create_group_service.dart';
import 'package:madarkharj/widgets/appbar_widget.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 224, 224, 1),
      appBar: const CustomAppBar(title: 'افزودن خرج', backButton: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildTextField(
              context,
              'مبلغ',
              Icons.attach_money_rounded,
            ),
            const SizedBox(height: 32),
            _buildTextField(
              context,
              'بابت',
              Icons.comment_rounded,
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            _buildTextField(
              context,
              'افزودن اعضا',
              Icons.group_add_rounded,
            ),
            Row(
              children: [

            const SizedBox(height: 32),
            _buildMemberChip('مهدی هدایتی'),
            const SizedBox(height: 8),
            _buildMemberChip('علی زرشناس'),
              ],
            ),
            OutlinedButton(onPressed: ()=>{
              CreateGroupService.createGroup(context)
            }, child:Text("افزودن"))
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText, IconData icon,
      {int maxLines = 1}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        maxLines: maxLines,
        style: const TextStyle(
          fontSize: 19,
        ),
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(icon, color: Colors.green),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            floatingLabelStyle: const TextStyle(color: Colors.black , fontSize: 20  , fontWeight: FontWeight.bold),
            filled: true,
            fillColor: Colors.white,
            labelStyle: const TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _buildMemberChip(String name) {
    return Chip(
      label: Text(name),
      deleteIcon: _buildDeleteIcon(),
      onDeleted: () {
        // Handle delete action
      },
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }

  Widget _buildDeleteIcon() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green),
      ),
      child: const Center(
        child: Icon(Icons.close, size: 16, color: Colors.green),
      ),
    );
  }
}
