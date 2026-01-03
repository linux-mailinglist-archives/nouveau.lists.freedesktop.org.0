Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD5CEFA09
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 02:34:52 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EECFA10E308;
	Sat,  3 Jan 2026 01:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KeQ4n+Ze";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 71C9544C66;
	Sat,  3 Jan 2026 01:26:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767403605;
 b=xGZ8jRMX7Dd4taWF1JSauUX5Vc1V/VVpXaoawWULk6aX+49j5DQADnzM0QH1C33x2yJDX
 nxU2we+NxLsOGYQEaSkyiqzd7lehbcn74PNoPyYeVmaI9tKdxd5uOlk2qCflk0gn0ebnNte
 rtX4QoC19f0I68iijL7MuqTjgi20J88jddqHRAgTv+fXovtUXvUIXvzHQ9wQhClXJKNosdJ
 iMInTwyXLbLqFsOZuo4xRQxYktfOAAYJA8DVWq5oVrzvQ4cVbT9QWIAXPyYm8QbSP1rXlPA
 o6196vc4yuxwdee41Q8Vj/1wj0IZlMHW/Yq15Ejz5L9x2+/IoadKcwrsZf1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767403605; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oHWI69MIHU9L8l8ZH6NHZLAzLRRoLszQxH+fScFdrik=;
 b=XchW6cid3vkw15WX+sMGNxmdr/jeq6JLFHh0ZoVp9PSYNzr2USsgOEPUnUhhWeMG1kxg6
 oNNZypIwG9S03uVw4vZhhRYNdCmnMAGrmnjCs6msEMtR7sKxVQ9aSzYihu4qjKwY8IOrEGF
 5stG/JYfuz7MQYadYbJ9aHekZaXiZvyKtym1lJ8mnURSbqRravWCRtQDSyioZRNMjfNQaZ5
 smUWqxQjtKHERAgiPNcQDX3dvpQGSclO9eH7Mlh2bue0fF1CYrc3XHo39TNEXxyElr1zO43
 MI+Q48BZrs7GpaLLxolxThtXeLgczY+8FWuPXbSxQtn2D1tLbmtgvXMJS8cQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B540244C45
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 01:26:41 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013011.outbound.protection.outlook.com
 [40.107.201.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF9CB10E2B5
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 01:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srhtgG62wLMItxog71QJkbkCsSAd2DBIMNZNMZdWpHI++Sx/KhY5aYo96i0RYYXduLK14+l+OjiWV+9G5ajT/ntjqSFTgp7GRcckKJwy1Opx/wBjIZq/iaRZ+Pk+4hGd/o/sdlcIQMql9/c/5DqEiSHz4SazDCk2UGqrG4YOLpCTdLbhW+s1GwqjLTOroA98aJHDj1acs8Itr8rjZbPXZVcxiI2he6vREddzwIZOWEXWeOpdBP8VmcQOMI+cYOV5eHIv9LfUO13IFE7jKVQJhoyW2wIL36dMNGSYVMZ6Z5Aqeq3F0ad9mAdVfjHkM0a484ZZnQNDr03ZoWXvv6W4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHWI69MIHU9L8l8ZH6NHZLAzLRRoLszQxH+fScFdrik=;
 b=wsIKspdTjYfllFJpymF5y9R/rSxdJRH7G1h0AJcrUnsIb1zjACWSUJ89Dmg5HDT/C3QYeri2KWQ+iu1Fu3FxC915AMaknE+or7IlaMoCLHBuVEMXHql/oL+t9hDikYDsahN4LxBekkf+Tm1B4MODt6V7zyYmz35E5QVjgHywHhc1dGcXDbdiwr1PLnv/Hxow23iXxRCwXxlhOk0Gd2R1bMGLM1QF5wsUPfGPetiNMRfk/Ha6mJ0M8017imcLNRKonaUm1SSeaqEYz1E2Tn68slwT4oARqmcFTr3MyavKHxSF1MbZh9TSOKxfIsmJuPDRndbw0D4QwUk/Lbf1MQkzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHWI69MIHU9L8l8ZH6NHZLAzLRRoLszQxH+fScFdrik=;
 b=KeQ4n+ZenvnRdGRzZ+kjNCaDuIgjo4+3L0alKJnbn/RzR3BShvcTXyFr0qUtwcljvyKu2sheC75xpwrc05gl7ySJZ00CM7dl3HsEccm2V5dTovc5WXaUz119lK+FSO2RIuinB2KiYu2LWiOe5+ez5696asaeo1NBeG2qZRaEwVQPlIgfcS+Uoz7SfTXANXi6HULNozIPU53A96dSi9RP0W2q38gIZScVn4Z1X6J3M2+WyNUN9823r6qEMcbtZhno8a4L3MW5lg1AwF6ixr4tWmtaditzXC0szwZ4FNhFSfR18Jv3eKTBq8/QvqYO3DuSfFlYO1thdXkgPvasLIDbfw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7646.namprd12.prod.outlook.com (2603:10b6:8:106::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.14; Sat, 3 Jan 2026 01:34:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 01:34:41 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and remove
 util.rs
Date: Fri,  2 Jan 2026 17:34:38 -0800
Message-ID: <20260103013438.247759-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc85b38-fc59-4d12-534b-08de4a6843d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TNplZCMnPn+gOzsV/adaFLEbdAyli2/cjKrZxjk40JzRacmV2JlCVCR0zcZx?=
 =?us-ascii?Q?VXT1H1sOSDLb4iJGVfG4u8yU4MQsVxlpV6La7LKjtbkaVtSTbAEHa5xgIVkS?=
 =?us-ascii?Q?Y5CiHNmxOwODmxzM+my4jkorLI/cTxAQtcrhSVHp+3nzJcXY+ghnuPRMdgr7?=
 =?us-ascii?Q?TwS6/+C+5knThX7nKApqAMjwSOjuXuePxWUPJpCuSbQSgUXwqXOAHu+iF+LQ?=
 =?us-ascii?Q?q8H2d2/h6gLY4J3Rhso2QZfg1Mxlzs191LCu4o3WSy76AKj6yGTgd/3e2d8c?=
 =?us-ascii?Q?uueaf/3ouR4VWnKY8MheToSQdgrOvOHiI0ZB3+uwzqI9wySWejE+xJ9c3TJP?=
 =?us-ascii?Q?2mhaYv+gl7B2JW12JpzwHnBbnlZYAooM4lt2vsDB11PKiXUzfS/I+CAdyqHo?=
 =?us-ascii?Q?gi/cf3W8vvnjA2t4+gagrd5i8wpA9PDH6cDmb2HAmWh7OFJq7akfAufKhSij?=
 =?us-ascii?Q?twGWHwGLILnFd7jrrxUJ9K1Xm/JBrAwwvm+V0W4WRb7Ns6ortgP1So+GQphV?=
 =?us-ascii?Q?2ZCCeJtkIBiA4CSoLLlyXBYnWinnSQirhHjfwj8qsm8AjqturMcRX2c3MRtO?=
 =?us-ascii?Q?7GIvSI/QXAE/RcYwqdfP2n9Xq3WKvhWuPsbbDxWRPF3ZGy0FOnZNDvbq02Eb?=
 =?us-ascii?Q?g8WI1++YdxPzpO9Wj2oP8u3YmMdQEvFC9I29VEzyvt62T7FNFtzat31l0QW8?=
 =?us-ascii?Q?sl59L9gZxad4V7Mf3DmYpXqickTHVeAGIhvxbcHGVAd5fLVuoCW5C5Yx34tY?=
 =?us-ascii?Q?l/vS2eJ9MYvkKrQuT65EnCQoG0A57J8DF8KrnNPXpysXCBYFWfSxM8Du+cP+?=
 =?us-ascii?Q?hDrKTQa4gSjDWZ3//vU/7/Z+JHZuH98TCpuoUhQIkF8St2LIej3t7jlPiL4P?=
 =?us-ascii?Q?qHp3/GnV3fywhi85grRHG3ywNr7smNQCwQbXDxxPkAMqiLcopAM8TtBCXvfE?=
 =?us-ascii?Q?AUE8v69FI5xcoQ//5fbfGl1LmFIURAhtVv3TObfhaaRitzAOTr5gjQj15dhz?=
 =?us-ascii?Q?EltSz1IM/WfV/eB8iyMvbJyTAPBCbiY5P1Z+GaUMxcLJhLaqpA/JJepCnm4l?=
 =?us-ascii?Q?XiT1vxv6YTNWy29zaDZ66XpMCd6YhJeVHL3oy7uHGy87Wlhqg9Iv4PjtkWyk?=
 =?us-ascii?Q?Y7zK4rq+Wo0JrBS5rnauAaTDSi0B+yMygwCQD0vzLR13copFhv9HA6qkXxwN?=
 =?us-ascii?Q?0g/QGKuE6swe9xXgs6Dr+bXxExAntFxEHg0rKs0BWansW+ZRhLTBfc4j4gMJ?=
 =?us-ascii?Q?kVZ1majRMTKv38EipKunLzTq1UZgd+mEbIEBr1yrUS89YF8NhOkA/Pk/Udfg?=
 =?us-ascii?Q?Qam3TRXtgmwQYwBidRESukyVVL72/WNK/JAGfo24HBeT77gsBQuohtqC8+0w?=
 =?us-ascii?Q?uMdZan+jsXCwdE/B45tE4YCqGASLiyalOiEH/0RPTK2bzMPAsPiclTIdX3Ha?=
 =?us-ascii?Q?zT8u1fCiK7+BgFKhzJoREfPAjqiV+in8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aLZ0n16S/90AyBpbghJJvL11X2bBB0fNQ/CRgDjFpynD5ya4Chz9JGiypRJi?=
 =?us-ascii?Q?7Ry/mW3MbQmaLTQevY/NJ3TfJWYPCjkIykDmQQaC6kT4Q7QjAwxMG3pkLC6B?=
 =?us-ascii?Q?DFURwePXJKUs/bASF6W89rAx3TuRCKLG5XtGtfUtn/astfQMCMutZMN87+mI?=
 =?us-ascii?Q?GWy5m5Ql/+oZjsZ/oa+vNS41hvVF5vV62ebhoF5TD57r5qj3I3VKP38zM+J8?=
 =?us-ascii?Q?e5bMXEMFkJMtBDlRLoy2+psrwWQJiMC2sbj/EmZBO/B6mHSJrqDBOxb7l8K7?=
 =?us-ascii?Q?p8NPEl5oaPXZXe8PtccVlvnHHFOJubA+tJaqqeJtnpE+0Bt/AXFDGEc/7aK/?=
 =?us-ascii?Q?fWjyoXmYePWRkrM1T4ETUwxT+8NGuvkn6KSSw/zxkulm7WpR2hndKAPowZqK?=
 =?us-ascii?Q?rq8mrUkFubq3Q1SPdNmbPqJ4yZ51ezaVFtBNINblYJ1Ehzlk9siXZclsfpGC?=
 =?us-ascii?Q?m8v7B5mcDMzhdSSNBBotw/GsClZPvT9Uc8lfa1T+YPspqokdbDkYb6dRQo6a?=
 =?us-ascii?Q?uhB+XXSNUnUZMbbEm7cSxaRMGcxA3aHIXTg+mx1jlhzlX6I2BY4j9sNx3/gV?=
 =?us-ascii?Q?f0vsurzAHrqhNj0aI2gJNsal3tjNO+ejGlOpVX9yZsV7+cOe1vnKIx0F/WJS?=
 =?us-ascii?Q?sLrd8f51KEQ9RaP5DgDivyXLmYXnvStow43WPGAHT47O/iU6ol89KTaL3gKK?=
 =?us-ascii?Q?VT99c62YVOlfb7CKXkjVGB2IGnsDjn3maQ/n0Bf6y9W+Quzk6Yczgsdj++bS?=
 =?us-ascii?Q?+GAYwBeCQYSgmsHrqUT0sDq+Z7hC+HRyQt1yYcC7Pmd+NBDtIKO5GXo4nJ2R?=
 =?us-ascii?Q?6RWDs+cMz2TOr2VGuymu9qqWos0aYw1RNYufoxeSvslkyKsM3vhjbFAZNQDm?=
 =?us-ascii?Q?USBxIrVxst6X6f3k06Q4mYHrSmgiQmTOJvAgtZozxcg/LWszLYTnhqK44CZC?=
 =?us-ascii?Q?HCtn3zefg66FO88JaS1/9Q3l7hxy8qOQy7ya2XU8uEeQg7+dt5fjdNDEDG/k?=
 =?us-ascii?Q?giW7eoa1iT/S5lmmJXv1Ag2fhIwvxD+JJJxd8zCNtxAKNyvDjfGrKR9MNrA6?=
 =?us-ascii?Q?vsFRNCuR/y/luLd7+sXx0mK1UMIesbOyU/5nQQ0EOk7CDoNzAxau1oXkI/5O?=
 =?us-ascii?Q?lUTXf+hG2IGDYcTyR7XDwscYYKZk9Ljn/Kf5W3gQ9kDXgfuexuSjdplT8cCE?=
 =?us-ascii?Q?UeABzlacO7ZYOdQRhRVZJf/2UOJHKhMBXPKwFTn3Ha5yy2JRuvhSgl0C/KIO?=
 =?us-ascii?Q?qxIVvoxYGWg/bXmiMx1ZkyABzSB1otc4ID0Z48wLie8Rbq+Fnt1aS5XZatUz?=
 =?us-ascii?Q?BsZFSwqL/V90lrAiwd5x61LZmmfDfNrWD26Xj4a6s+f247/oQDZ4RfsARiLo?=
 =?us-ascii?Q?8xqKXCmastpMIXJn3Bz8pubY0JO2es1gOLYLyGnT6XlduAKIVVpRgNVzrhQq?=
 =?us-ascii?Q?6POe6SXodVgAihSF5uuJMB4FtqY0NaNhFfv65oVFN37TPOk32gSGaffzwJfC?=
 =?us-ascii?Q?gSOe0IcFU3MSMKuwFnpRSP8ODETV+lh8z1kwByx5Q2+XKcuY2ZUueSq8oDU0?=
 =?us-ascii?Q?/LwypnBfe1H1D6T9sCmH3yHX2yJRt6h8noDSXMLTwZe4T2C1E8TkJ4Xa8JPe?=
 =?us-ascii?Q?ISuvIQDUwiG38C7l9fTGCM/znv7y/FAb5FoF8yE4jby4OoOW8H8A8AM1RHfi?=
 =?us-ascii?Q?Dn2kfqudc2UdC5tzLBG0I2PK68Wnyz87U9+FY78ZsCmUhB+fqJauQNi7cw4h?=
 =?us-ascii?Q?qIzu2dF2tQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecc85b38-fc59-4d12-534b-08de4a6843d0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 01:34:40.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GpCf800jqlK4sji2t2i4Gcgivc/z3/am/WVyPrtW1olj+odbmNV4tGWVsSukPbZPAixgzISICsqFsePyZM6+oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7646
Message-ID-Hash: OKR3PHQFCWHET4PMGGHECJRAJN6BQEFL
X-Message-ID-Hash: OKR3PHQFCWHET4PMGGHECJRAJN6BQEFL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OKR3PHQFCWHET4PMGGHECJRAJN6BQEFL/>
Archived-At: 
 <https://lore.freedesktop.org/20260103013438.247759-1-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The util.rs module contained a single helper function,
str_from_null_terminated(), which duplicated functionality that is now
available in core::ffi::CStr.

Specifically, CStr::from_bytes_until_nul() is available in the kernel's
minimum supported Rust version (1.78.0), so it time to stop using this
custom workaround.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs |  5 +++--
 drivers/gpu/nova-core/nova_core.rs    |  1 -
 drivers/gpu/nova-core/util.rs         | 16 ----------------
 3 files changed, 3 insertions(+), 19 deletions(-)
 delete mode 100644 drivers/gpu/nova-core/util.rs

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0425c65b5d6f..a11fe6018091 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -30,7 +30,6 @@
         },
     },
     sbuffer::SBufferIter,
-    util,
 };
 
 /// The `GspSetSystemInfo` command.
@@ -209,7 +208,9 @@ impl GetGspStaticInfoReply {
     /// Returns the name of the GPU as a string, or `None` if the string given by the GSP was
     /// invalid.
     pub(crate) fn gpu_name(&self) -> Option<&str> {
-        util::str_from_null_terminated(&self.gpu_name)
+        CStr::from_bytes_until_nul(&self.gpu_name)
+            .ok()
+            .and_then(|cstr| cstr.to_str().ok())
     }
 }
 
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..c1121e7c64c5 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -16,7 +16,6 @@
 mod num;
 mod regs;
 mod sbuffer;
-mod util;
 mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
deleted file mode 100644
index 4b503249a3ef..000000000000
--- a/drivers/gpu/nova-core/util.rs
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/// Converts a null-terminated byte slice to a string, or `None` if the array does not
-/// contains any null byte or contains invalid characters.
-///
-/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
-/// slice, and not only in the last position.
-pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
-    use kernel::str::CStr;
-
-    bytes
-        .iter()
-        .position(|&b| b == 0)
-        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
-        .and_then(|cstr| cstr.to_str().ok())
-}

base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
-- 
2.52.0

