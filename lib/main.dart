import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/app_provider.dart';
import 'utils/app_router.dart';

void main() {
	runApp(KinPointCareApp());
}

class KinPointCareApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
			create: (_) => AppProvider(),
			child: MaterialApp(
				title: 'KinPoint Care',
				theme: AppTheme.lightTheme,
				onGenerateRoute: AppRouter.generateRoute,
				initialRoute: '/',
			),
		);
	}
}
