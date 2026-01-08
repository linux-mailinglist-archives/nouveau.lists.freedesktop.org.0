Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BDD033F1
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 15:13:21 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66F5010E740;
	Thu,  8 Jan 2026 14:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="sobhcryA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9186244C77;
	Thu,  8 Jan 2026 14:05:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767881102;
 b=EtaVGGAtQsH3Vmb5q4RWhawNOjdRSQDXceebfSs0mH30B8yOseSKJ9WZtVsGfsyVakgTC
 /VV9UYrXD4y0WOCUSo7P2nhlVDyZ6ATnu5YQpd1jIHOYT7QvswZzKEcuLvAmUvVeCw+8ul3
 Dfn9S+Uh0ukPy9Eceqb+tUQbAnLrIGWUn7/eeLgYqHk5LsooDTZ8GyDagMD9KiCghKVgeb9
 DjKLso2gzzjdVZ76erRJujtZ0GQT248IcB0WQoTRJ7lDN0p0CTxI/6mXF1KYvqOg11VYUQK
 8LVa62hTbzhic5zXNgRW+HLCJyLf4qjvivoreJCPRVESX9DQuF4eBhxoXDlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767881102; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oAY9tT8eJhmBBuB/pALjsirq5MjDRqqbDPftc5yERJQ=;
 b=ELQai6Yor9OGd66DFmzKqjb2qyVOARENTK8R2kNwF2cOYYgQLBBOkye5f3KIXZj8rqNMk
 ItBUT8pd9upMvVOKf2u2U+z0yqhJXVkvI/NkqnJtuygpzH+T7ez084sUzrro8teBZj9tk9+
 fLtFP0U6PIaSTW6EjG8rEMCxOfheSV4bVTzHM9XNS9UaysOg5Y0+0mLa0LOfMIdDB7K1wks
 2TJcK9oeMOwA92I77qGzqc3c4QJZZBS/7jMYUVG4spBY9S+OpsedId3Nqtu2V75zQiFiDm2
 w+XHYn7/sNb+kZJRXN5U4uLVrqaax4XRdezDPCFILqynBKMxVVJFJvbOzgCQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DF41941ABB
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 14:04:59 +0000 (UTC)
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022084.outbound.protection.outlook.com [52.101.96.84])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 393FC10E73D
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 14:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqRXiAiv7fkD0JcWXn2j3OgLfPK3bghl2v5macWxNJitv7rzIG0nMSHafLqqG9Vs36p6pMCbNJXaD9cmknADjvjTQiiQhDTYhbn8X5L1rv2mN5K7wJANTIYOA2FSGbcY3zMvFF/i6Mo0P9j38gb986IF1CMTCWaD3QUODCVmOqU2eHWrYGcCmO9FTQdHz0ZegrmEmLY5W823ZX6nMIO/WHa1OqJi0ZTs2en6mEN+ymGZADtKSP7jkoGpnXhyjEFBBIQj7ey9G6cl1iNx1mHV/V5oGwXvaPhhEZTfNQ54LiJp14udBI4UOQRRpjXpe9W+kuXiEpem5yFZoRmDSA42+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAY9tT8eJhmBBuB/pALjsirq5MjDRqqbDPftc5yERJQ=;
 b=Mge5EawRB3TIy3f3gxwM8G1frHI2HLHt++QUBfa/wJL1kA3NVB3Qaux9AmnTvj/cF53FfV8BkXc/RrInyADw9KAsHR1KrRrhdO/gceW3saYqHpDtoFQ4e5foRxXHbAU/LbFdKn7lNyA3R/NbwNjqsULv8YyH6mzq7FKEmezjjrry//pOhOHLqg//eBvj3p/3ZXqLqs9uGqaEp+gfpH4clgRk2RrxRvihh3eDdBPiCDtBrBhXfhv0ad3DjDegLd9EaFLr0kBQ2RT75lw45EZZrDhB7GLETAGTEqjJ13vjViJSbL55flJUBtUDZHlpZcIIzjGRNQHWhiaBWohcAM/RXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAY9tT8eJhmBBuB/pALjsirq5MjDRqqbDPftc5yERJQ=;
 b=sobhcryAVCUxknPhvGV01+HnPzy/XsNyUl2RJWM2vurP7KT0FLlsmw1ysZNEC+CmVLiNFynvmT506Lc+d/VvH8esF1IqMyngfKMT+696ZPzPEWNUEpBocnE3cnHeEzydceDkN9kfmkQYWLXUgOQg7NfpDU077ejhmJGazzwkImg=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB3661.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 14:13:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 14:13:14 +0000
Date: Thu, 8 Jan 2026 14:13:11 +0000
From: Gary Guo <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several
 print strings
Message-ID: <20260108141311.4c9b07c7.gary@garyguo.net>
In-Reply-To: <DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
	<20260107012414.2429246-2-ttabi@nvidia.com>
	<1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
	<CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
	<20260108125523.5c7810ae.gary@garyguo.net>
	<DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB3661:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9fa492-0dbf-44e5-5389-08de4ec00fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yC4NLY/0GKi99xXpQBXZdOyXg1pbq8BC5WC69f5J7sCctfhZjJ1US5Ms1ceV?=
 =?us-ascii?Q?7VEz/KXBPsOBRsv09B8Q0kBt+RqrtfBBtYAeD614ugM4s+cop79Hf4yfY/rc?=
 =?us-ascii?Q?eZ/o0WA9xTWLejsv3awsuif1xHwP3yC4sLE4p7U4eAcNGb7CPKgRNyIc96BY?=
 =?us-ascii?Q?IhwXpMR50wbHUUoZ03SvKCrAYNqoRWMVOGgWdzWPJ5FuSz7zN6txo5PNxdX1?=
 =?us-ascii?Q?aTCSHMFcMyMwVO4/CRvAdhIYyuBS2wAmq77mndhp1BjnwRqjVuDRAA+g+pAA?=
 =?us-ascii?Q?65ucy1zbEL8t34DTmcTb/zNA6mUpUzHUjQeV7fZd91nsS6rPpwkRWP5mLP7J?=
 =?us-ascii?Q?6379BKvsA3QOCuqn6L3/+WyQva/0PmDuQYw3DLV2eInZ1Ahp6f23twQ+h+lD?=
 =?us-ascii?Q?XTmlnRjQ2jvw/9Aw+JDpc5DH/mcZnxI9bd8+xW5KRvku3nX40Oq76z9PBkmE?=
 =?us-ascii?Q?Dgx/83+TnzJdh4ebfvj48jHKax2MMgOgSIc1qyK4eRS7Bn5mGZ+n8tKqV07O?=
 =?us-ascii?Q?6AhZNIXtFEng6Ke/IwLOeForEa+NjqY/+8DdhezyvhHQHx6f1tkp6gwYGglf?=
 =?us-ascii?Q?jFOZS6SXNm9e0K9wRPjpxx+CZjkJa4G+SB960kvHkjF8SoEhz0voNm4UYl9c?=
 =?us-ascii?Q?9U/ztRIcxA73POP/AUD0Jq/wf1MB8kNhWkYGku5qo+hMs3ETZ1mON/bLrB+f?=
 =?us-ascii?Q?ne91KA/k4Z/aq/oE0sCEZPL/JfQ5B7GIxxZO6pbRYvJ27/dhQEtHkqnTHjlO?=
 =?us-ascii?Q?n9ehx9sm1IRSQf46PP19MVX9Y20q7QVOEJigSHU+6e+YzKnq92gOdeGC2qCv?=
 =?us-ascii?Q?SNaka/XoIIUh3NZQ9un1YIePWQ0k0rOyaUIO0PxNnsfW1BLn9vMB9bh2S0OH?=
 =?us-ascii?Q?43mNEv6u552ZW1uP0pRpX+X2QRDFbV2Z23sC5zdqLCN0Jw/YAGWzz/ePLsiJ?=
 =?us-ascii?Q?bk8E4i7KI73ZEV6ZkrmN/6EsjbDi0TosY2mcZ9jS0qPWi9GjKRuEsMQjmxuC?=
 =?us-ascii?Q?UpSNFWS3eu5lhcfApbABfsovQ9OZkYFdS49JMArGrkBw6RHZ9GVzjgHzOjgC?=
 =?us-ascii?Q?mrnleI+A+40dV5wO+pzmePPIQNGqNsgD1iUkl8g8lPChPzNgRBfEYcPktfZP?=
 =?us-ascii?Q?FcxIkNDZnWa7KGFC8g+C5jwK2vOTjzn0H2rFGaQYu42CtPDfPZd5yfIr4E8o?=
 =?us-ascii?Q?ipVz5YXsXjf7h+QVatHtpMXU7FC6GWOcJ2cOLgtcGjOXzohBDDQkM5g9MAJQ?=
 =?us-ascii?Q?6jAFuo5k8O0YaZXc5W7u0MmUVigihrWlKuA1jQTgZK6Ibva3LlYWo3GQV/aJ?=
 =?us-ascii?Q?t6BINIe9HK1JGiv2kw0Y27wXF7WumUEFLWY47bLknF8hLBG2+LBZpdsMIoP9?=
 =?us-ascii?Q?3p79OGbVNIW6joZqaqHR5e1InEyZ8RuUyBKePmK87jerQVUGR+z6cz3r+VNe?=
 =?us-ascii?Q?lNMXVOffYbWV/7/tWRfRX+CHErJzwOZN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XT6WIjzdMxUzKP6gEV+3QD6QZqovwpN+oOpbnDAXRmWt1QXHu3P5ZoY7ku3g?=
 =?us-ascii?Q?CWlpwncVFvpk5EtbYZz7pBuRn/ouJ/WykNDPVSG2d3BoBQaYPxjtjFwNtVg9?=
 =?us-ascii?Q?npb+hUZGdogOkJoHIBFmBSZN3vhXjwK3v658ZStqjE+7CiQSLf0lAYHMYj47?=
 =?us-ascii?Q?aSjVp/JgU98yHzNa/3a0DhqPXuuYQxD9/zEv/A8cVtq+cxAPtGynAtCNKiry?=
 =?us-ascii?Q?IAr4Gx4lBKFliMH9o6MjwqjVd7rNsl09J2QvUAbhCl2Sv27qIa0+ThEON075?=
 =?us-ascii?Q?37MkdgI0v0AgmmssKYEAuzvFn5soXIMslENLg7ZElDVXxLxREnZ2LAMsUcxp?=
 =?us-ascii?Q?Gnx0XUVgi96rnVYz/+/3K4Q9759hwAFRG1PYU5PMtqz8rG4OUgWGiJI7YGm4?=
 =?us-ascii?Q?rPkc8c8ZqiOTwGWYUOtUWZsjSneDqojSIsQeP6+npcCK3E2U2M4t6JHgitqA?=
 =?us-ascii?Q?EYdv+eMU9JBC1kvjU1MQes9pFUmSk15zmBo5iOcRXHu60YarcqUEnvh8c94w?=
 =?us-ascii?Q?6B64aR3vjbsxUXTp3SLnGP2O7KARg4k9S7U46pC8UstLhkOBofX79C/4Vk+Y?=
 =?us-ascii?Q?y6c+jAmJO3grctoJn7oVJViLpAk0eW+qxtyQ2bs86OLcxRqqJVEeeN61SF91?=
 =?us-ascii?Q?q1lCOO6Oj5NeG9zXl/sbCy4ndgx9vycm096y86HRR0Hl2wySU5XsjL1oprqe?=
 =?us-ascii?Q?x4nKu+M/Sx900cKY3rplRl4Njt2j1fmVSP7Qmc4yOW3COytakGNEebju2quG?=
 =?us-ascii?Q?hXjPwcHYQ68J6s4lxMo2BdmjrF1jCRiXsd7A/16pR/UGEIWR7nC73I6jY9zV?=
 =?us-ascii?Q?wLtr632IWS2iZyJWj86MZKbAfeTdluyyBhxc9JNGsDJ1TTZEWElmtUfbwS5v?=
 =?us-ascii?Q?EHFRuk4HhXkI6ATDtHcBWA8d7U4iohPnuuuEf6tNoYjCiVbpGAuPxYefErh9?=
 =?us-ascii?Q?0MHDkzWaMcCYXI93EvLsVkx1zeveOHzvWQu5ogCeAnGKkGs69BiUTyTHlw/W?=
 =?us-ascii?Q?CvMBHBT05ekn0+TGrn/rwQY5laSHmsul4D+Za35x2W2YOaQVT767rZAf9Jyt?=
 =?us-ascii?Q?p+yow1AIKX+6RBYtAee8D/CsR5gaKIUs0XxmDBwUcQBtrqAEE6qsW2hZUSea?=
 =?us-ascii?Q?bbf4Eho+aQbhm5ROHR0bB1+Db3bnu6zNlTSnowUCU+ZrJmuCmth3jAbCkLpT?=
 =?us-ascii?Q?yWUOPp3IUzQIyF31kviamStFIPc30IarNwULTR8zMvWQPlVdGS4Cz0+QvWlz?=
 =?us-ascii?Q?en1Al41w5p+ayZ57kxO2M/YaA0YFJgY4P/XPpsXwlySTViW0k5pJ6C+o2k4V?=
 =?us-ascii?Q?F4ZM/xizvgYQ0JbnRiqf6eJbqUK54rKg+2mOzNP3QAeqxMboN5o8mYlii7TU?=
 =?us-ascii?Q?nIJHSk/3J+VisBf0tw0nhJTix7fWRyc/qef8J5y7rIHq8QDQMtMlZZKSzwko?=
 =?us-ascii?Q?7vI18U1qvM7o+tdxAhB4uP6aaail2o7jsHZibRWYSH7qXauidVdHJeHETZaJ?=
 =?us-ascii?Q?OkRhjXBAoLcRCf3+0YsKkUZdBoaTdc4pEFp/5Ev5qz/WDWe+3PGiqJ3KZ0j0?=
 =?us-ascii?Q?D3oLqeRWl0Bzswrz7E8dgfKsd92640IXhdBrGC73WBx1PufEMjgisSPrk6YA?=
 =?us-ascii?Q?6Zvq4Qj+Lrl2A8qGkdfFqdOUVM/BbiNTbikiqauhWJdIpluCHF8GQDzu6MpR?=
 =?us-ascii?Q?gDTVBRPEDrKjxn+xkvoPGZz3Os+KlTni6cxf4gjGcPID01Lozs37KdEsmwBj?=
 =?us-ascii?Q?1X2xTyNjNQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bd9fa492-0dbf-44e5-5389-08de4ec00fce
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:13:14.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Bs5SKu0QAc6KpV1gRmky5Zv+kuwn6foJqFKpps4wW1u3ucpGG3U0DVyTbni/m8xumJVpOgSyuzA9NP7uCqLevA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3661
Message-ID-Hash: SMLOA2GTVXPNOUYBZF5NARIJSOYECWFA
X-Message-ID-Hash: SMLOA2GTVXPNOUYBZF5NARIJSOYECWFA
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SMLOA2GTVXPNOUYBZF5NARIJSOYECWFA/>
Archived-At: 
 <https://lore.freedesktop.org/20260108141311.4c9b07c7.gary@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 08 Jan 2026 14:36:21 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> (Cc: Greg, Rafael)
> 
> On Thu Jan 8, 2026 at 1:55 PM CET, Gary Guo wrote:
> > In very early days (before RfL is upstreamed), I had a prototype print
> > macro that is designed like this:
> >
> > 	info!("foo"); // pr_info("foo\n");
> > 	info!(target: dev, "foo"); // dev_info(dev, "foo\n");
> > 	info!(target: dev, once, "foo"); // dev_info_once(dev, "foo\n");
> > 	info!(target: dev, ratelimited, "foo"); // dev_info_ratelimited(dev, "foo\n");
> >
> > There's a trait that is implemented for anything that can be used as a
> > printing target.
> >
> > I still think this is superior than just having our macro mimicking the C
> > side (and as a result, having a lot of macros rather than just one for
> > each level).  
> 
> Why do you think this syntax is superior?
> 
> One disadvantage for maintainers and reviewers would be that it is less
> convinient to grep for pr_*() vs dev_*(), which is something that people
> regularly get wrong. I.e. it regularly happens that people use pr_*() where they
> actually print in the context of a specific device.
> 

One solution is perhaps to always ask people to specify a device so they
won't mix things up?

If they want to print without device then they can refer to `()` or
perhaps another marker type `info!(NoDevice, "...")`.

> > I think with Rust printing machinary, `pr_cont` is rarely useful, instead
> > of calling `pr_info` followed by multiple `pr_cont`, you can just have a
> > custom `Display` implementation and print it in one go. This is also free
> > from racing against another print and have your lines broken into two
> > parts.  
> 
> This I fully agree with.
> 
> > I would be much in favour of vouching deleteing `pr_cont` entirely from
> > Rust codebase and always have newlines automatically added.  
> 
> I don't think it is a good idea to always add newlines. It might be fine if you
> only do C code or only do Rust code, but if you are switching back and forth, it
> is a horrible inconsistency for muscle memory.
> 
> I'm pretty sure that this would turn into a generator for trivial fixup patches
> either removing or adding the trailing '\n'. :)

Well, we've seen that people will forget either way. :)

More seriously, printk actually strips out your newline. The new line at
the end of print gets turned into a flag on whether that log record is
continuable.

If we say "pr_cont" is not used in Rust, then it does not make sense to
leave any log entries continuable -- I would imagine in the future we
might even want to bypass all va-args machinary and just push the record
to the printk ringbuffer. Adding a newline just to have it stripped
doesn't sound ideal.

Best,
Gary

