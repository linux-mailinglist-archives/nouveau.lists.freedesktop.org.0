Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D5B48DAA
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 14:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AAB10E202;
	Mon,  8 Sep 2025 12:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d1OkGZ32";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F09C10E202
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 12:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzFIHhOLZmWYCP7g22j/pyqXpfgdyaS/6VsckYQz1OxJ9CkwGTS/7gM2sbBJ/2ZgQU4l36R1q1QrEmwgUYUHeMMNpiEBpgLnPj7Njr75TfOQcTx+qq0LM6YrC6C/hqKsjr+SgcgaEHhc6Pg6hNSd7gVrkbFlCvkRkjCdBJY/1+4f4Q0S3Ngj73X8Ke4cr3v+hDtzygymlD7MN3W1LpLXFZR/h/6yILJiwIsbsQ4QEl6I7CVDLHleIqeOeGfgnv9jByIisnl/Aff9UMOaDQTtlZyMj4TOn/bTfssLpVA3mW8DV2zvv0IsPRd/gWsnp+GUzuBAAwjSLapm9Q39gT4Kug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGf5WSH2znD6Kk9IJ8hzCUFFpoJHVE+gHl97LeQnKR4=;
 b=DXReTuqfzH2a5Q50D3BqFuiEhtK1HueVebIxRrn9oxj/TC8z8uWLAye3RgmsZGE2YYhBPumY/+c+nu7/1HA84SFGkW5DxabiJyNGojBN863y6X+ef0jFclaoeDjJqK7rfiijSPtGCN1h5Jm3lHnaMznxMOpbXmhmzLKFcbwhKVhzXyRrxvMRqgp5uUrA9qFU3bR4xCjCfNg5r3HXZIYmWECYgjB3TgCBRMNw2jrZz/ACZTT9U+lzXAG5Z93T89e6XBGXIugscYxYPGkF7UW1TsLkzTebX8gDHs9rcfIe3BjrMtnosDTC2hK+r4cYtrVAVOb5oSWdXTGxM23Hbvp9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGf5WSH2znD6Kk9IJ8hzCUFFpoJHVE+gHl97LeQnKR4=;
 b=d1OkGZ322HJ/Hs9uWiGHAFHFcPESNbwwUjZtqPTuEHEt/c9bQBZUNYGNOVb1ceaPoH6ZahvYsAsfUJllW/WeoZMDBL+ZKMODWsfcyulZfdC4LJiGgzBi6cP6JlC4JHcdoJeJi+GoU5wwwYFuX4ItnPf+cVLnws8xrMvGpPR8EDngXkTdncZAawW3hON4KM8fFCWu6g8Rc3kBNrjZLEfMDlg09j3v4gYy3jWtc/Ygn0j+mE9toMwKCzttfa1Ij5GC2gBtIiXLPDYT9Ca9GIWTtD/i2t/h45Kz5+deROySdxLS/efW2QKitL9JiVkYtidT04dqbZFlRoOK7V0hMeNiAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 12:36:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 12:36:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 21:36:37 +0900
Message-Id: <DCNF9KPSUQWW.2PKY7OGPWNOT5@nvidia.com>
Subject: Re: [PATCH v4 1/2] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
 <20250821-num-v4-1-1f3a425d7244@nvidia.com>
 <CANiq72=wsLQtOmXuqAnLJbppq7BgdU=XoZ7hT86LkwLYEWp3nQ@mail.gmail.com>
In-Reply-To: <CANiq72=wsLQtOmXuqAnLJbppq7BgdU=XoZ7hT86LkwLYEWp3nQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca5bb70-0bfe-49b6-dc66-08ddeed45bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1Z2amRib053UjlaNGlyNzNlOHRBeXFqc0RNaEVXUTZkeTdqZENXdGVrUjJo?=
 =?utf-8?B?OHJCUXZkMVUrYjZkSy83MXo0d25la1dML0NzYTcyVm1uVUJoVTNkYjVackdO?=
 =?utf-8?B?WWY2dm9ycG5KdmRxcEMwVHNCSTl1VVRaNWN4T0J4Rm5aSTEyWHJiU3pWYXFL?=
 =?utf-8?B?UEF1bERqZWlPeGRvSXNMTWNqMmI0b0JwRGZRZ09ZMG83em5Gb2VKSUxkRmVl?=
 =?utf-8?B?UVN1LzBTcEFmczQ2N0Z5SUxZYzRuSkdLS3NURzNqSmx6dDVqV2crR2ZzZXFn?=
 =?utf-8?B?K1Fld2lUSlRCbkZ2TzNhenNsOW1FVmsvYWxITkxiU0dzQXNsajk0MjRHbjF2?=
 =?utf-8?B?c3c0WFMzSFNyNWdwOWtTRmFSdE5ub0RXalh6ZUowU2UvVFRWWGdkT0JERHNI?=
 =?utf-8?B?QzFyNXU5dGZwNXBkOHhPdHNQREFXMGszMHQ2Zkh3c1lLMkN6SkQzcmVPQXBT?=
 =?utf-8?B?dENOT3BmNkdITnU2aWRJZzR0WmFCaXBadnFTa0tPeXhMOVdKYU0wMTlnNVkx?=
 =?utf-8?B?OGtlald1Z3ZWWU85U1BlOUZjQ0dvVE9OM1JlRmErRlVVWS9iTmhLN2p1Wnp6?=
 =?utf-8?B?YWRmU0ZjUng3TlBhRUFYdFIrYTYrakhEMXBqcWM4L0doTnhMUE5vbFdReS9Y?=
 =?utf-8?B?TUxzS1FTR0kyRWdlWitYa1B2STNaQlZ4UWttVFI4dGNzZVBlVko2TTh2QVgz?=
 =?utf-8?B?cnlQeXp1QVVlL0FMdkNydEVFaEVFcmprbjcyYTF4alVWNm9LWnhJTUF4eGM0?=
 =?utf-8?B?L1o2WWxhSEJPVTFoWTVWd09uT2QvWERvbzBTVUI1OExpYlA5QU5GNHRzTWl5?=
 =?utf-8?B?aTZnZ0krK2lQNnBXQTdLWHNTN0NKdk5SVm9RWHhaM1FDSnh1WnF1ZXNwK1Rn?=
 =?utf-8?B?VzQ2aWpLV3BtdzF1WDdVQzVUUkJkNTFpMmx6OUxEdGk2RGwxS3c4RFMvaVhD?=
 =?utf-8?B?dzJ3R1pvc00vdy9ycXN3TUJmSmpkU1F4bG9hSnVGVWFza0ZGcndDZXlrRW83?=
 =?utf-8?B?UGpDcHJ2VU1ZOUZmZ2Q3a24wdUVFS1BQMm4wSitLQ3BPaXRVK0huOHluTU5k?=
 =?utf-8?B?bzdjNmdMdlV5R2ZZcjY0cTZDV01wRmg4UTdtN0RxT2hWSGpsVXo1ZzRuMkJP?=
 =?utf-8?B?Wm1VdWlsdTllMTNQMHBFSUNKQ2E4Rng4aVByL0l5ZGZYSjVhaWpaOG1Vc2FN?=
 =?utf-8?B?VjFDbnVDYk1SVnM0TXk3R0VDT3Fxajc4T05tV3Jvd0NmUWthejVtVzdKckYx?=
 =?utf-8?B?cS9pT0Z1VnZrVXBPeEd6eEFIbDM2RlJURGhENjBOeSttWFl4d2NHbUNhTzlw?=
 =?utf-8?B?K2dZOFlLZlVHK3I3bzlSbjIxbW9jbHRvR1dmSTdFWWtHVlB1elVjZnNzbU85?=
 =?utf-8?B?WGp4SW83V3IzZVdXTEExTVhrYVQxbnpha2NybnBWYU5lbit5b1ViSllNV2tC?=
 =?utf-8?B?bHg5Z0VJY2wrKzlpcGx3azl4aVBRM0VpM0Z5aE9hdTk3L3dSdFd4R05SM0JO?=
 =?utf-8?B?a1dhMEdSL2I4QkM3TjdnWnpMaWl5MVhIbHkydldDUnh5dTJzdmE2bEE1WURQ?=
 =?utf-8?B?cnFvdExYVC92Rm5lMnB1Z1k1R3pKVW03eHZCN3YwNjgvcHZMeTNGMHNkREpO?=
 =?utf-8?B?N3pLSmIzMkpnTVBDM083U2lOdlBGcXZZRGpYaEZOMlZYdkJYWUJYY0FPcVJS?=
 =?utf-8?B?VXVIdjg5QXptWDAxeWNoUk9uaHFHMm5EMmJhbUdwUndRemlRcXUxT3gybVJT?=
 =?utf-8?B?QWdtMi95SjZEZHRCYlZPNCtCOFg0dXNUNWNxbGxMY1pHQnI0eFNuUFRac1A1?=
 =?utf-8?B?OWljL294SFBRRGY5Y3AzN0lJYTNmQUs4R0lvNEY3UVI1YVppc2dacVRTc2tF?=
 =?utf-8?B?eFg5R21wUUJBY1VyaFBpRlRaeENoa1lEWitIWEhiRlE5Mk43NFNHa0tlZjJR?=
 =?utf-8?Q?8AGlKec+gSU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm1NdGRheUlsUXo5eWpBTUowZUdWbnFYSHhJM3dWb3MrM2FCRDVkK1lNLzE5?=
 =?utf-8?B?eC9XcDJDT3NwazZTc2h6NHgzdTY2MnJFSFlpTUdWRGZ1bWFZM2lsNS9NRXV6?=
 =?utf-8?B?MkFlWVFCQXNCNmttR09RMmt1QmN4d0plbDRmV3hjeDFzZGRqbnVBeU9majlt?=
 =?utf-8?B?R3dpaGE4eVJlSU83YitwaWp2MmlFbXR3TGk0dytnQUJFNkNGdjUyVFo2Y3J1?=
 =?utf-8?B?QzhGM2dNQ055R0dvc2x6NExtZlFJeGxjKy9VMFhTMjdhM1lIWHNCb1RETDRP?=
 =?utf-8?B?TE5OalJuMjBZelRMaDZlZm9VMTNJZWlZR2NpNHV2T21zOERJb3k3ZTl2Uldu?=
 =?utf-8?B?VlZHNGhBd242MFpQUWh6T2p4V2M4a3ZETmV1OGpRV3g4WlVvMkh2Yk1jTVFk?=
 =?utf-8?B?ckZxUTIreUpSRHVSbW0vRFBsK3gwYnQyNE0xekh2c25ES3VSK29FQUViMDVy?=
 =?utf-8?B?dVFhQTVNUTF0ZVU2T05sVk1UNEpHcnhxc1BhOW1UNXZiZitTeis3ZUNpejl4?=
 =?utf-8?B?cEJYQ0NEZm12KzNjUUtwNG8rSStmVmNnY0NhL3k2Znk5NlZoTWt4ampveU1U?=
 =?utf-8?B?YUo1M29RMG9IRXpqVkNmZzVEMHVFVXZtSTdDRlVpbEF5OVZGMWp0NUM2em94?=
 =?utf-8?B?eHBjRXF4OEY0dDI1dzVXbzk1dllZd1pjbm1ONm9LMVNHR0txdlgxQjZFcXpY?=
 =?utf-8?B?dU00b29sWUtENy80QU5vaHFzZnFESFV1a1ZlZkhqM0taR2hvdkxqM0dwYlkz?=
 =?utf-8?B?K0dTVG1sMVFuRzBwNFRlZCt0Unl5dmNqWGhWbVBWYnJaVlpMN3FuT3hzVE9p?=
 =?utf-8?B?OTVzdkgvOUUvaEVpeDlDV1ZDbGpNUWRscGpKUE9SNHBySnB3eC95OXR3TVdN?=
 =?utf-8?B?dTMxN3RMTUZjL0RROXFYaklWZmpCQ2VULy9oaW9xdStxWXBVeWMyemh5Q0N6?=
 =?utf-8?B?SlNtRUsxdVE3QmVzTFl6aGFPcG5JRkYvcmZPWEJzdlVxVnpaV1Q5VVdqN2lm?=
 =?utf-8?B?UWRLQy8za0hxcTJSalp4RVI2L1R4U2IvcU54RXJHV2lmZ2xIOFk3NHVpdlIw?=
 =?utf-8?B?NDJjOWh5bHdwaG9mdm5ZbGo3TzZHZ1FodjZCRjJvdnpSRVRKYUJLa2NWZm9I?=
 =?utf-8?B?ZTZVYkdwR1pqbi9RSG5QRjkwWHpNV1N4TFdtYzh5aHkvZWhVc3pCdjA1SW1o?=
 =?utf-8?B?Nzd5M0h2SENwMlJ3bjR0RUtHU2I3WUx6cGx2bkxoVVBRWk5KSkJtVm80b2Vx?=
 =?utf-8?B?VDBFL0ZzTmJ4T3BISzRKWHM0bVMzQTZUWjQzYWFpSGkrQXVOZ1VPTlMvSmpZ?=
 =?utf-8?B?SGlVTWpvaDFtKzE0MEtmM1RROHhHSzNwL0FFbTVwcjVONUxLQVRZZUNMNUJC?=
 =?utf-8?B?djJjanpvYTlHMVEyYjd0dzV6WUpsdTIvRmVhUFBnaFBjT0VuUFdpY04yYWxH?=
 =?utf-8?B?aERreTNEbk5iaG9EczVjQ0trb1hkMWNoSWU4TFJ6SnljWTZPNnBvc0dNM01F?=
 =?utf-8?B?QklOTnJGSytPY0lHSTgvZEE5MGxtYVY5SDBaL1BrSUorQ3VqNmxEK1pqK1Jy?=
 =?utf-8?B?R214ayt6T3VIL1MxNzlnWHlzeG0wVFFoQ3FVVkJEVUpUV1FzVmhVRytpcms4?=
 =?utf-8?B?WUJqd3M2eHMzQzFVOXJaQzFWSlAyaHZFQVc0SXFuelZNU21KVmIxbzFSVkVk?=
 =?utf-8?B?dFZlbjBoM3IyZzNkd0J1OThzancwM0dMYnppWFNLZFgrQjdHVnBQd3JnbGpL?=
 =?utf-8?B?RjdHM2NKckptV29rZWRPSWxCRDZJZEE1UDBrTzh2TDVveVBEM0ZsK0xvbkRr?=
 =?utf-8?B?a1Q1ZGlxeXB6aGs3N0gyckxjWTNHV1dmbHFPU3ZjY0NwdnA2YmVCa2w1NEFJ?=
 =?utf-8?B?amxMK3BlZisvYUFlalZyZWw1ZldPNzdpOGxlZkV2YTFsUGd4L2NrTHJjTmNt?=
 =?utf-8?B?NCs0WS9IVFk5T244clF4M0lwbVgwVS80c2N2cVB2Y3BCa3JTaHcxcVd3UHQr?=
 =?utf-8?B?aXVjVnJuaFZBcUlHdk5yTGJlLzBycHVxYThjd0w2Ym02SWIvOUo3Sm1heExG?=
 =?utf-8?B?WEpHaDZNSG42eUc0Y21DN01OaFk0SFpsMUtJcW8zaW82aFV1R0ZpQit1TGNn?=
 =?utf-8?B?UjVWbC9uM2dwaU84am5NM0VheGJnK09HTi85ZlFHZHpPbmx5WWVrTjdoai9o?=
 =?utf-8?Q?/Xj7L9/i0b2NcEpSq6qdq/CnVm/EiYYkpA/IDAwtOeDJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca5bb70-0bfe-49b6-dc66-08ddeed45bf0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:36:40.0833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OxfN06dtcmblp/Oh4NrEQvhquPbPEzVTxqZy6+cGJCz8QGUsmgyIEqhFl8PK1FEXUzIr2ERY/RUmqgtiUCjAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon Sep 8, 2025 at 9:18 PM JST, Miguel Ojeda wrote:
> On Thu, Aug 21, 2025 at 2:42=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> +/// TODO: Temporary substitute for the [`Alignment`] nightly type from =
the standard library, and to
>> +/// be eventually replaced by it.
>
> Should this be a comment, i.e. `//`, rather than part of the docs? (It
> is fine intermixing if needed, or putting them at the end of the docs
> too).

It's probably better as a regular comment indeed.

>
>> +    /// Validates that `align` is a power of two at runtime, and return=
s an
>> +    /// [`Alignment`] of the same value.
>> +    ///
>> +    /// [`None`] is returned if `align` is not a power of two.
>
> "Returns [`None`] if ..." is probably simpler.
>
> (Sending these two nits since you will send a new version with the
> const generic.)

Thanks, I'll apply them!
