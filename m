Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A7BD00821
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 01:58:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5416310E66A;
	Thu,  8 Jan 2026 00:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ry7+KSZZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D443F40385;
	Thu,  8 Jan 2026 00:50:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767833404;
 b=I2SicCMRNgJYcpHFLKiHYYkRHLsG6U5e7smBd+ZzR0YbTTT+1DzNGzOTsCh3C2b8gTM5w
 ZpPqQr8PgHbbydEL4tYOizSUM3i/z9VvINSFb7B72EtsxcKGNLoFBTrW1RIFvBbUE6ptIxJ
 EQlPa8Hs9GBC1tTPryTDrb4TrbgWU0fF1oBIFs9VZtIPSiDH0HoBXFmzBZ3vSdNkJur6jpT
 2Bq6caEZdvL7M0jQy7a4arHD8VGJySpnQmkKJIEnU5Z2GniXw2A4mk3as8F4TWFKfkogGpc
 +8n9cAtrDOgRsk2osHgUpp4Ifhte1v3T4f/FpwWUDosajZafyDj1ak0OXbGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767833404; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FCbnJ6BkQ0/jrATW0dr/DjcIupYsNoRll6dxAAco7XQ=;
 b=VSiS7c6YRSJ6HRCPF+yL/QrIBsj3gurqFTY9spGssA2Jin0t+QMynjGU4ZRSD+42X3l+w
 AqUn+XzC0jbPv/pncBspLekneiUuwadPhW1LG/NUxHd2c55kWUKhkEAr//qvUnck37iumuB
 60sKCA3EYZDlNYmrX/2RbyRXMGbHBcdwV/7BQbi3q7LsAV/nBVVNa0ECiBmpCeO/jBgQLcS
 TphWBoaJfzCSihoIjtTZO24ptE873Qs1LBB8km7ERT1hp1ga3mjvqTmcuWhwxzwUpAWJBOH
 +jr9ZIbbYihJjpmExONttEc5hIsi8jGGs9bLjFre2m28DlvkJ0JIwS8fiTLA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0680440385
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 00:50:01 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4480A10E2E0
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 00:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvHtKg0LbSfhhzx0ONyM+l0atHOZk8NLBZwN3qG/4GD0oiBFtM9VJttWXURNYTpa8ggvFN3JeeNik+J1iJ7DDNVc/k123PgrwgrSbVd/EK6x8jCnZF5NBCkeW43Pdf2LE1sYMEsI/4XZvl0aORrFHAIsBcXuVCa017mHv+2TeFtNq5Hl/KyoEsY4UlaV3cYCyolkRu4zBuC3EZt6wEbW6ApOxcNTAWwZozGmXzAOZxac4H7XUDyPRmTPXiiznJZdUnjaYRD1jb/r2+Al6J1njZJxnLvgruOOld5vbVbKJ4FhvnBWiNTBW9PDIjatSUINoaVQeluQkvgq4EZ23crCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCbnJ6BkQ0/jrATW0dr/DjcIupYsNoRll6dxAAco7XQ=;
 b=epTYSYSXTsctGWaVAkyjvog+Lg7kIegeYXd3Oe/vREXphupQaqmfNkq940SaSZfhfchY8sgfSeFNSNifYcuCJsnbw25eyEGRzhmqJaqIxotBBQAvRU4hPCOMe5dR/sM/EiUAgGzTgNul+EDOYwREz2ZKnO9yxlimG8xbXAzbV56V4/5fR7YmzKeeVT/adKRpM/tqrdmxb7qtgt9wb5lmYPvMhhP6zGB6G6oMaaAMwkPVKFgUc0jcIufwyO0QdQbS/azAAC3/gHQ2S7uaPt1XydlJm6Fk6qF9+bcdTd7RRCgwKxYSPaVWpe7m1hyTZ8JELxQUHyV7s76/MAv7nF89Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCbnJ6BkQ0/jrATW0dr/DjcIupYsNoRll6dxAAco7XQ=;
 b=ry7+KSZZ9RGbPX4R50qrJ0LNJ1f73cnygZrce0P1pN+HCoZmBV+16xfjYFdgQxMFnQE+K4bfDuYzjDKVrqQMcJS9AWTEqyUuyHjDa2sdZ0IhJqVLIqs4Gxtz1DHGxwHMq09jlPMpWGCOu14ZwxWOe+5UoDZvSlPZGmXOgK04H6G7F24y3VzkoqDpHTBj8Y9GmWx4oOZhq7t765wbZTh5+GmZTamWcn3e5mzeWYiAQIwVkasSv3OkWMuAhuxvxL25GgMzMaF4dIuRQFNr6rpRK4eR6fYz/X3Cq96JAkBUpd7qb0bXZWsgAz8Iy427HWpDe0fh/ETgtUT+EIu2JpGvfA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Thu, 8 Jan
 2026 00:58:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 00:58:14 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: preserve error information in gpu_name()
Date: Wed,  7 Jan 2026 16:58:10 -0800
Message-ID: <20260108005811.86014-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108005811.86014-1-jhubbard@nvidia.com>
References: <20260108005811.86014-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c07f0e2-cbb8-4f37-389a-08de4e51009e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/P5hFpnHPMsDRynjFaAVr3wAzKa/uljXfHfhkquWQlSeAvCxHL1jdkjp+yYY?=
 =?us-ascii?Q?DmN5dt6wsmDw5OEoNgMC6Voi4vo2f+OyDGCAjnbq83A43bY93U3TemXfF81O?=
 =?us-ascii?Q?eIzRbyqrgND0a+SRLngPLqELYoSvA9VYyE5TVzJfErkXerR3UrhbnGwCeLGc?=
 =?us-ascii?Q?PrqWRC3zyf946vFEMXUJn1JyFhulubmmoIjEjm5vcQASQeGSnPBNjnQ4wceH?=
 =?us-ascii?Q?KclyX+mEj+lOkUdc/EO0REwSvYKA44Tkj3SS64VLoldCF7zitsadtHjaGhW1?=
 =?us-ascii?Q?9hd2zni+2Nifs1ifgASNQk9xaNcK7bXcWOMaCpbYCMMVK3jch1Tt4RKgtb+V?=
 =?us-ascii?Q?AlAZnaCxmhT3J2+OLmQ+QfO1sU4tAnrRl3N53YmXN65U4Yyk22d5cFd9CJgB?=
 =?us-ascii?Q?UQJ4w4NF0+gXXmLYfyIlX7KhjcVlY9SuCI3XO2LaU9q2Q8NQyBOcVg0FiJUl?=
 =?us-ascii?Q?6aPJYax1bPBncLyBBc2YeJwoDpkmBbHFQ8pCcB9pgQ7CeFGFgcho2TFhuiUa?=
 =?us-ascii?Q?pxOM/hv+Wy6dOPkLCD6JLnFdCFiLoiHOGeenAHWYTfCLMRyHUlrlN9dhP6KM?=
 =?us-ascii?Q?coFyvv9T7Rum6pv7rZHksYDp2Y8y7MQnD6zb/3Hm89bpjYW4ZzjqMv1Q9AtJ?=
 =?us-ascii?Q?SVDnsCvMsAyuJtisBKMf8cwS/Q+aO+O2ukU0tOTaLCkDWSRiatsfOuq/Df/c?=
 =?us-ascii?Q?cU8z1jMARYQpFaD8ueyP2bKP4hCacsXYK0RK5k5tvAZZIvFJnmy14+AU5Y9L?=
 =?us-ascii?Q?u+xT2Pnv/gFDRFDiUqEN6J1pN8k7JmIYiXaezTrgje6NVP9OUd0UP1GZd7qK?=
 =?us-ascii?Q?rgFdHyIfSiboKoZ4fvoivG0ObEjaYzSrtz+A7mQqZQX3Md1L/RYwEtJC1BXO?=
 =?us-ascii?Q?drCuXViZ85l8VP4OLU9k+WeTFYMS+sEbR25Ppj10um+IzustzdFyL994r5D/?=
 =?us-ascii?Q?PUffEJfdPp6k2ao+rd5jnbK30pUvV15DMYazGUSr2D+eWC1q8L4Lluhv994f?=
 =?us-ascii?Q?nmTzXudda4gJmVSGBSiJc8S2x4T2eP894HqbleuhWzpoTD5jBucCUjhtbSAa?=
 =?us-ascii?Q?L4E7/XJoGdje515cB1LE+UTPR6dbea2jMxO2tIjZSRm1G3pu4F7WcfhaLuzm?=
 =?us-ascii?Q?6lUlKe8KP/hzX8oceW5C2JCKFC96UujJfMATyfFYPtA/3k1I8kwr+EsVuF/s?=
 =?us-ascii?Q?s5lGoq7irXzx9yJEK76rdaXqVDOx1abSziYfaW9hw8wG6PPvWK0djDnKXVeC?=
 =?us-ascii?Q?1ZK2CZpbKCUCGLBw757zrGWk3gSp60+ptFTn4fFIWNl8kQOv5+jYGqYxq2Ei?=
 =?us-ascii?Q?ycZuECKTG5xoGGz55kwgG+hOcvOWVCRoCCSRDvEA/FCs6FeyGnZXcpJUkY1T?=
 =?us-ascii?Q?KBJx3hOtCEQKc8oKIBYsZq6YUvJP7TfUGcx6mgVcR30/btXU8owIofhZhHRf?=
 =?us-ascii?Q?GcOCKbdFh/HrtCb78zkzG/Bwk3CElp6k?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SYXwgqnPoMyUPdXw0R2IMUBN0zGigOe321oyzSy/KyYYJ+XOCgae9BgBR1pb?=
 =?us-ascii?Q?glFW6dz3xN9pS8qgRrUscDcT4X6iTwdDzS0KFymuxYdpBDngFcf26CnHqkdS?=
 =?us-ascii?Q?eHcWNR5mmN3/P1jAW8vH+AhQ6OvE9uyk+R86LmJAI8k2zGNvrd7M8OG+ct7T?=
 =?us-ascii?Q?CocvlNmcFxmUoe20Dx4rCnsp7JHq3kxCdhBI9YvTUAEESqnXZ40NQbQHmAhQ?=
 =?us-ascii?Q?EfI2/Kxg5KlnECAGZTrN06YFJvJHvl7lPDp/UNo2Y1pdVkb3gHWXRg6FY4p7?=
 =?us-ascii?Q?vYNzvBrdulN7onNziFOFJSjPvGIMdyH4p3quOsGdii1TXWCp0zb/ajbqAKMh?=
 =?us-ascii?Q?PITVeHeK/J9AlT+e55juQkxAEBUIrI4GQ77/1W73ks2346W4Csxe+57Ldn2D?=
 =?us-ascii?Q?3TsOm7rmoQEN6f/rejWxVLLdxsVFtVW1kNGr+WQQYO322W261JWOFWSJfVXR?=
 =?us-ascii?Q?tgrqfDTq5B3y8wdEAzsNtN44KBwJyaPlxqHtpnsMhoz0lkdAL8ChnfozKbv8?=
 =?us-ascii?Q?MnErUoi63YXckB95sJiXhfoLPOFrgWxwoi4Mn+yX+duvzGfKnpjKS4G8EYbO?=
 =?us-ascii?Q?HCYjkOFw6JegT+Rf6BDAAYt6HNVXS51YpXIKmWlk9SCrIkfTsX1gPOUmA1Qf?=
 =?us-ascii?Q?8PWgSfe8CJph8SDizl+IRj5hlrHHRYz3DvC8+WG1Zh1fVkJa62qkwEaloV7l?=
 =?us-ascii?Q?LZQqaRkHVAVl6D9y+RJzXcDRN1Hp+C79IKikaCl/karQwmfEFsdGBGlHrXPF?=
 =?us-ascii?Q?3VlwiX+rsYAmbwSPJHjqXQZ1wgwFFeyzi6/q9K8YpS6VoDcVyLD03CGAAeft?=
 =?us-ascii?Q?Gf+L3BoZP1JEJ1CscOdIoEi7SRKdh9jQVEytPSvK3P5E0VbQKe4kTCevdVCj?=
 =?us-ascii?Q?wlnQmPHGnDHh8hGNScG/O+g95vbvepYRs4FV8lUe92EX9VecZicak2aZtC39?=
 =?us-ascii?Q?/p+ERsdDvwwwI6LPicSkJP0ZRaytNPNNTV8uETpow02S3WtMLV5A+oGRCU8h?=
 =?us-ascii?Q?bwm9RvJzlUUopI6ajTnx5FRmbcxcCua4LACSuO6h2SdFUc2cK2RIg1hAbkMU?=
 =?us-ascii?Q?qnc9uQ1cszmgyfFIuiwJdVp568KM16l7sGthRf4US7Mn35Nw5IAs5j4F7iZT?=
 =?us-ascii?Q?gOVdt9ykpzVUkB2uyRoBnutgUogYAw0/qSzIOfclcAnJnQpE3iP5pX9878Wj?=
 =?us-ascii?Q?kovQfXeL3oRQkNeLbRDtvqpk4GYBaOF1B8U1seW27eeEWeTC5OcE0GXggCXi?=
 =?us-ascii?Q?XZgLMH/hRv1s1tQrEX3ravbpkXZcGbsQzdNKwzBw9KTeXjbbECpS4ZFhZ+rK?=
 =?us-ascii?Q?9B2qmd05NsX4cpMpmTFxh/i5rYkEQHK5AhkA97CD1ONSubO/pF+SB42mYog/?=
 =?us-ascii?Q?gVlCQ71IKWMGU6Diop+mOU6rF2sF/5l2XOa2E8l4ZqxQXWVmORBZug8dl8jo?=
 =?us-ascii?Q?IvHXA+Ingjb7qUNWpYhZtOrwPbY9zhuO1j3LCmG5wN2Cj6GrGccibThOCFli?=
 =?us-ascii?Q?dG5yjoGd1IiZ3OZrRl4kfKONbuldHEx8DeSs27Ty17Rb5GyM5TrWANKscsy0?=
 =?us-ascii?Q?m21FFBNXI720NRyxY7TW3egm5qrvGPCtzpZV2KCBD8Rq0N1G1hqK0+F2xYej?=
 =?us-ascii?Q?vMq5xMpa/dA8W6BVXY1Ii/1x9ilYS2HjHWGGaie8P43c+kAm5nHrIHnwU8/y?=
 =?us-ascii?Q?eThUPYjxpJCqLrMTynGN/AfsZl1etHoYd9YrGvfm1zDlPbM9KX1StZg+OgHo?=
 =?us-ascii?Q?MGsb+QpPqA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c07f0e2-cbb8-4f37-389a-08de4e51009e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 00:58:14.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 93tKBXRjtAgiC2MGgL4YzG4Rb6Vws85hPKUJpadMHmfPOwEqR8EL+iRoYr1GyWMykPHLsaJ0qvl1xBzMrdcwLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285
Message-ID-Hash: 5RTWJKCSQ7ODKTPQJYYLIP5SD6JSUTXT
X-Message-ID-Hash: 5RTWJKCSQ7ODKTPQJYYLIP5SD6JSUTXT
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5RTWJKCSQ7ODKTPQJYYLIP5SD6JSUTXT/>
Archived-At: 
 <https://lore.freedesktop.org/20260108005811.86014-2-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Change gpu_name() to return a Result instead of an Option. This avoids
silently discarding error information when parsing the GPU name string
from the GSP.

Update the callsite to log a warning with the error details on failure,
rather than just displaying "invalid GPU name".

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  9 ++++-----
 drivers/gpu/nova-core/gsp/commands.rs | 28 +++++++++++++++++++++------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index a53d80620468..4a5c49a502f7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -238,11 +238,10 @@ pub(crate) fn boot(
 
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
-        dev_info!(
-            pdev.as_ref(),
-            "GPU name: {}\n",
-            info.gpu_name().unwrap_or("invalid GPU name")
-        );
+        match info.gpu_name() {
+            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
+            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+        }
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index a11fe6018091..c8430a076269 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -2,7 +2,9 @@
 
 use core::{
     array,
-    convert::Infallible, //
+    convert::Infallible,
+    ffi::FromBytesUntilNulError,
+    str::Utf8Error, //
 };
 
 use kernel::{
@@ -204,13 +206,27 @@ fn read(
     }
 }
 
+/// Error type for [`GetGspStaticInfoReply::gpu_name`].
+#[derive(Debug)]
+pub(crate) enum GpuNameError {
+    /// The GPU name string does not contain a null terminator.
+    NoNullTerminator(FromBytesUntilNulError),
+
+    /// The GPU name string contains invalid UTF-8.
+    #[expect(dead_code)]
+    InvalidUtf8(Utf8Error),
+}
+
 impl GetGspStaticInfoReply {
-    /// Returns the name of the GPU as a string, or `None` if the string given by the GSP was
-    /// invalid.
-    pub(crate) fn gpu_name(&self) -> Option<&str> {
+    /// Returns the name of the GPU as a string.
+    ///
+    /// Returns an error if the string given by the GSP does not contain a null terminator or
+    /// contains invalid UTF-8.
+    pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
         CStr::from_bytes_until_nul(&self.gpu_name)
-            .ok()
-            .and_then(|cstr| cstr.to_str().ok())
+            .map_err(GpuNameError::NoNullTerminator)?
+            .to_str()
+            .map_err(GpuNameError::InvalidUtf8)
     }
 }
 
-- 
2.52.0

