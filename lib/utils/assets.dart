import 'package:queezy/model/category_item.dart';
import 'package:queezy/utils/constants.dart';

class Assets {
  static String lightIcon = 'assets/icons/light_icon.png';
  static String background = 'assets/images/background.png';
  static String background1 = 'assets/images/background1.png';
  static String personQuiz = 'assets/images/person_quiz.png';
  static String personWalkingMobile = 'assets/images/person_walking_mobile.png';
  static String personsNetwork = 'assets/images/persons_network.png';
  static String personsMeeting = 'assets/images/persons_meeting.png';
  static String backIcon = 'assets/icons/back_icon.png';
  static String google = 'assets/icons/google.png';
  static String facebook = 'assets/icons/facebook.png';
  static String mail = 'assets/icons/mail.png';
  static String password = 'assets/icons/password.png';
  static String eye = 'assets/icons/eye.png';
  static String closeEye = 'assets/icons/close_eye.png';
  static String person = 'assets/icons/person.png';
  static String swivels = 'assets/icons/swivels.png';
  static String selectedPicture = 'assets/images/quiz_types/select_image.svg';

  static String cardCircles = 'assets/images/card_circles.png';

  // ICONS
  static String crown = "assets/icons/medal.svg";

  // CATEGORIES
  static String art = 'assets/images/quiz_categories/art.svg';
  static String history = 'assets/images/quiz_categories/history.svg';
  static String math = 'assets/images/quiz_categories/math.svg';
  static String music = 'assets/images/quiz_categories/music.svg';
  static String science = 'assets/images/quiz_categories/science.svg';
  static String sports = 'assets/images/quiz_categories/sports.svg';
  static String tech = 'assets/images/quiz_categories/tech.svg';
  static String travel = 'assets/images/quiz_categories/travel.svg';

  // AVATARS
  static String man1 = 'assets/svgs/avatars/man1.svg';
  static String man2 = 'assets/svgs/avatars/man2.svg';
  static String man3 = 'assets/svgs/avatars/man3.svg';
  static String man4 = 'assets/svgs/avatars/man4.svg';
  static String man5 = 'assets/svgs/avatars/man5.svg';
  static String man6 = 'assets/svgs/avatars/man6.svg';
  static String man7 = 'assets/svgs/avatars/man7.svg';
  static String man8 = 'assets/svgs/avatars/man8.svg';
  static String woman1 = 'assets/svgs/avatars/woman1.svg';
  static String woman2 = 'assets/svgs/avatars/woman2.svg';

  // IMAGES
  static String topPicks = 'assets/images/top_picks.svg';
  static String rankerCardBg = 'assets/images/ranker_card_bg.svg';

  //NAVIGATION TYPES
  static String homeFilled = 'assets/svgs/home_fill.svg';
  static String search = 'assets/svgs/search.svg';
  static String leaderboardFilled = 'assets/svgs/leaderboard_filled.svg';
  static String personFilled = 'assets/svgs/profile_filled.svg';

  //Quiz Types
  static String boolean = 'assets/images/quiz_types/boolean.png';
  static String checkBox = 'assets/images/quiz_types/check_box.png';
  static String multiple = 'assets/images/quiz_types/multiple.png';
  static String poll = 'assets/images/quiz_types/poll.png';
  static String puzzle = 'assets/images/quiz_types/puzzle.png';
  static String typeAnswer = 'assets/images/quiz_types/type_answer.png';
  static String voiceNote = 'assets/images/quiz_types/voice_note.png';

  static List<String> onBoarding = [
    Assets.personQuiz,
    Assets.personWalkingMobile,
    Assets.personsNetwork,
  ];

  static List<String> navigationBarIcons = [
    homeFilled,
    search,
    leaderboardFilled,
    personFilled,
  ];

  static List<String> quizTypes = [
    boolean,
    checkBox,
    multiple,
    poll,
    puzzle,
    typeAnswer,
    voiceNote,
  ];

  static List<CategoryItem> quizCategories = [
    CategoryItem(
      asset: art,
      color: Constants.pinkSalmon,
      name: 'Art',
    ),
    CategoryItem(
      asset: history,
      color: Constants.dullLavender,
      name: 'History',
    ),
    CategoryItem(
      asset: math,
      color: Constants.pastelPink,
      name: 'Math',
    ),
    CategoryItem(
      asset: music,
      color: Constants.hawkesBlue,
      name: 'Music',
    ),
    CategoryItem(
      asset: science,
      color: Constants.mintTulip,
      name: 'Science',
    ),
    CategoryItem(
      asset: sports,
      color: Constants.pinkSalmon,
      name: 'Sports',
    ),
    CategoryItem(
      asset: tech,
      color: Constants.tulip,
      name: 'Tech',
    ),
    CategoryItem(
      asset: travel,
      color: Constants.dullLavender,
      name: 'Travel',
    ),
  ];
}
