-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2020 at 02:36 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitalspark`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `msg`, `date`, `email`) VALUES
(1, 'Avinash', 'hello avinash', '2019-08-18 12:36:23', 'geekyavinash@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content1` text NOT NULL,
  `content2` text NOT NULL,
  `content3` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content1`, `content2`, `content3`, `img_file`, `date`) VALUES
(1, 'Lets Learn about 5G Technology', 'The new 5G communications system will enable high speed, enormous capacity, IoT capability, low latency and much more', 'first-post', 'The 5G mobile communications system provides a far higher level of performance than the previous generations of mobile communications systems.  The new 5G technology is not just the next version of mobile communications, evolving from 1G to 2G, 3G, 4G, but it provides a new approach giving ubiquitous connectivity.  5G technology is very different. Previous systems had evolved driven more by what could be done with the latest technology. The new 5G technology has been driven by specific uses ad applications.  5G mobile communications has been driven by the need to provide ubiquitous connectivity for applications as diverse as automotive communications, remote control with haptic style feedback, huge video downloads, as well as the very low data rate applications like remote sensors and what is being termed the IoT, Internet of Things.  5G is able to provide much greater flexibility and therefore it is able to support a much wider range of applications, from low data rate Internet of Things requirements through to very fast data rate and very low latency applications.', 'Like all widely used systems, the 5G mobile communications is governed by a series of standards. Building on 2G GSM, 3G UMTS and then 4G LTE, the 5G standard come under the auspices of 3GPP - Third generation Partnership Project.  3GPP has a number of different work groups, each addressing different elements of the required standards. They draw on industry expert who give of their time and are sponsored by relevant mobile communications companies. In this way the standards are written and developed.  By having a main industry organisation that controls the standards, interested parties are able to influence the standards to ensure that the required functionality is obtained. Also as the standard are international not only can different companies work on different elements of the system and know they will interoperate, but also for the user, capabilities like roaming are available, and the cost of phones, calls, etc are reduced as a result of the savings of scale, etc.  The 3GPP standards are updated as specific releases - each release refining elements that have already been described, and introducing new functionality. Previous releases contained the standards for GSM, UMTS and LTE. As 5G started to be developed, it too was incorporated into the standards.', '5G mobile communications technology is rapidly developing and it is becoming the technology that everyone is moving towards. Not only will it be able to accommodate the super fast speeds required of it, but it will also be possible to accommodate the low data rate requirements for IoT and IIoT applications. As such 5G mobile communications will be able to encompass a huge number of different applications, and accommodate very many different data types.', '5g.jpg', '2019-08-31 13:06:07'),
(2, 'Introduction to Artificial Intelligence ', 'Lets start with What is AI? How does it work? What do I need to know to bring AI into my business?', 'second-post', 'Artificial Intelligence (AI), or machine intelligence, is the field developing computers and robots capable of parsing data contextually to provide requested information, supply analysis, or trigger events based on findings. Through techniques like machine learning and neural networks, companies globally are investing in teaching machines to ‘think’ more like humans.', 'Artificial Intelligence is a complex field with many components and methodologies used to achieve the final result — an intelligent machine. AI was developed by studying the way the human brain thinks, learns and decides, then applying those biological mechanisms to computers.\r\n\r\nAs opposed to classical computing, where coders provide the exact inputs, outputs, and logic, artificial intelligence is based on providing a machine the inputs and a desired outcome, letting the machine develop its own path to achieve its set goal. This frequently allows computers to better optimize a situation than humans, such as optimizing supply chain logistics and streamlining financial processes.', 'As you could imagine, artificial intelligence technology is evolving daily — and Business Insider Intelligence keeping its finger on the pulse of how artificial intelligence will shape the future of a variety of industries, such as the Internet of Things (IoT), transportation and logistics, digital health, and multiple branches of fintech including insurtech and life insurance.', 'ai.jpg', '2019-09-01 15:52:51'),
(3, 'Introduction to binary World', 'Do you know how analog values are represented, how digital values are represented using Digital Number System', 'third-post', 'All the computer systems communicate and operate with the binary numbers which use only the digits 0 and 1. The devices which are having two possible states will only be adopted. The following are some of the examples of these devices:\r\n\r\nA transistor is allowed to operate at cutoff or in saturation but not in its active region.\r\nA switch may be opened or closed.\r\nA statement may be characterized as True or False.\r\nA BIT is a simple way to express Binary digiT. It is a unit of information expressed as a choice between two possibilities. Here there are two possibilities of information which are either Zero or One. In this binary language the first (or OFF) state is called ’0’, and the second (or ON) state is called ‘1’.', 'In the year 1964, Taxas Instruments introduced this Transistor- transistor logic (TTL) which is widely being used in the digital device family. Most IC manufacturers offer TTL circuits; therefore they are readily available from all the distributors.\r\n\r\nThe typical TTL ICs standardized the input and output characteristics, making possible interchangeability and ease of procurement. The standard numbering system used for TTL is two letters followed by either 54 or 74. The fundamental circuit for the TTL logic is NAND gate.\r\n\r\nNormal TTL logic levels are given below:\r\n\r\nSupply Voltage: 5.0 V\r\nLogical 0 Output Voltage: 0 – 0.8V\r\nLogical 1 Output Voltage: 2. – 5V\r\nNoise Immunity: 0.9 – 1.9V', 'The normal number system which we use in our daily life is called decimal system and it contains 0 to 9 digits (10 digits).\r\nThis system is also called as place value system, means that the value represented by a digit depends on the place of the digit within the numeral.\r\nUnlike decimal system a binary system is consisting of only two digits, which are 0 and 1, these two digits are called as BITs. \r\nThere are two major groups of systems in the electronic circuits and computer systems. They are called as Analogue and Digital systems.\r\nThe analogue systems are the systems in which the output signal varies continuously. In digital systems, the output signal consists of only two levels. They are high and low.', 'binary.jpg', '2019-09-01 16:59:01'),
(4, 'Lets see through Google Glass', 'Google Glass is Google’s latest product that hails a new generation of tech gadgetry in the form of augmented reality eyeglasses.', 'forth-post', 'Google Glass is a wearable computer featuring a head-mounted display in the form of eyeglasses. The Google glasses function as a hands-free smartphone, letting users access the mobile internet browser, camera, maps, calendar, and other apps by voice commands.\r\n', 'Google Glass will soon be a reality, with Explore Edition units of the augmented-reality eyewear set to ship out to a select audience in the near future.\r\n\r\nGoogle Glass eyewear is being developed by Google X Lab, the same group working on other futuristic technologies like driverless cars.\r\n\r\nGoogle Glass is not to be confused with Google Goggles, an image-recognition Google mobile product app that is available to Android users.', 'Early reports from testers suggest users can expect \"curious stares\" from those around them and several incidents of fights and verbal disagreements have been reported between the Glass wearer and people around them who did not wish to be recorded in a public place. One person in particular, Sarah Slocum, alleged she was harassed and attacked for wearing Glass in a Lower Haight bar (Source: SF Gate). Since then, a number of bars and restaurants in San Francisco and other cities have implemented a \"no Glass\" policy to prevent customers from recording other patrons.', 'gglass.jpg', '2019-09-01 17:20:34'),
(5, 'Li-Fi will be faster than 5G', 'Do you hear of Li-Fi? Maybe you are familiar with Wi-Fi, let explore Li-Fi', 'fifth-post', 'LiFi is the short form of \"Light Fidelity\". It works on the principle of Visible Light Communication (i.e. VLC). The network is also referred as VPAN or VLC Personal Area Network. The VLC transmits data by intensity modulation. It uses LEDs and Laser diodes (or photo detectors) at transmit and receive ends respectively. It works in 380 nm to 780 nm optical band which is visible light and hence the name VLC.', 'Following are the benefits of LiFi system:\r\n\r\n• It transfers data very rapidly.\r\n\r\n• It transfers data securely as it can be used in Line of Sight mode of optical signal. It does not pierce through the walls and hence it cannot be easily intruded by hackers.\r\n\r\n• It uses much low power for transmission compare to other systems such as WiFi.', 'Here are some facts to support my upper statement. No matter how fast or secure Lifi is, there are still few drawbacks and limitations that may stop it from becoming a true alternative to existing wifi. Let me write a few-\r\n\r\n1. Range and Line of Sight: This one is pretty common. Lifi requires a direct line of sight to work efficiently; your signal can be interrupted by almost any obstacle lying between you and your lifi source. Light can\'t pass through walls, hence, your signal is restricted to the room only; where the light can\'t reach. If you move out of sight of LED, you lose connectivity.\r\n\r\n2. Cost: As I already told above, you need to be strictly in direct sight of LED to use it efficiently, meaning you may need at least one device for each of your sitting places in your house. And you also need an individual lifi receiver for each of your device that you want to use the internet on. Plus the fact that you may need to rewire your house too as the lifi LED will need ethernet wire to produce work. The cost is going to be way more than normal Wifi.', 'lifi.jpg', '2019-09-01 17:50:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
