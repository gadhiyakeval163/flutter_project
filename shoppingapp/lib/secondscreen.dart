import 'package:flutter/material.dart';

class SellYourItemPage extends StatelessWidget {
  const SellYourItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell Your Item'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'SAVE',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildImageWithDeleteIcon(),
                _buildImageWithDeleteIcon(),
                _buildImageWithDeleteIcon(),
                _buildImageWithDeleteIcon(),
                _buildImageWithDeleteIcon(),
                _buildAddPhotosContainer(),
                _buildAddVideosContainer(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.orange,
            child: const Text(
              'Earn too many is a flash! Get a great price, with deal made in 5 mins',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.orange,
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'NEXT',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithDeleteIcon() {
    return Stack(
      children: [
        const Placeholder(),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddPhotosContainer() {
    return Container(
      color: Colors.grey[200],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_a_photo,
            color: Colors.grey,
            size: 48,
          ),
          SizedBox(height: 8),
          Text(
            'Add Photos',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddVideosContainer() {
    return Container(
      color: Colors.grey[200],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.video_call_rounded,
            color: Colors.grey,
            size: 48,
          ),
          SizedBox(height: 8),
          Text(
            'Add Videos',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
