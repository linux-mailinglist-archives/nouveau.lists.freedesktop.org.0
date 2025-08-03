Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1D7B19413
	for <lists+nouveau@lfdr.de>; Sun,  3 Aug 2025 15:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A191610E0D9;
	Sun,  3 Aug 2025 13:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qaukY/nJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3869E10E0D9;
 Sun,  3 Aug 2025 13:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0hpF7IDaL6T/qKP/er9m1fRWIW4BZ5gdq66OAjTQKB4i3xuYI6xopnYuVcBjtHAnVoSNldqu73qEHydSt+tJwaRCrYCLrC9uHCXglHIb8stj5P1gzDcW+XskYJ5sE9JxfLPqvHDT78sHzWPgMSQK/IkIk8jSlwE2r3m/i6/HUJy6ik4Ac1dYX1Y4k/y0FL2HFUeX4FJOhgjGxPsbs0WRdcvWkRZ6K2ldr7hDRZ47VDQ8UGFpK/QFILnthmbtKHWN762qh5EgdPlLQ5U1AqgV5H/Zh6q+ciEPeP7D2a+WzNfAv1WjI9XkUwhy6hrwg/WHJDXbkD6obMueQ4xi+1n7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goj+aNQK3bmjjatdMbpXNIBoCbrB50XVTD9o0aJz2x8=;
 b=gipJCcTgcGR+KqWeRXSM026igp+mHJvvgkSeOWXI1hsV9YqSg4Vh2EqWSP1cRjTABHR1uAoj4XnuNNCXbfFFhClHRWs5gcQBYCUc5U4eQdkqlU2Ya+HPUwtdIXu19ImjTQelNThLlzh8m5iZKh7dXgZWTsjDSOOd0JDoUGH8defU4ukmLGQFx692pUTcsD7vaLzZoIqH/qq9af/X6E89xhk0Pad4nQ1BYxC6lmG/uy2wXf62bmh7Gy3uw/CeZwsGtPpPit5dvrFjSSfCAC9aU7dU6MPDUpcQjbyJlDMuhqoYENSz/bchxqOOUxoxS+FhVKTE7ne+R4CtEcBXKmAS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goj+aNQK3bmjjatdMbpXNIBoCbrB50XVTD9o0aJz2x8=;
 b=qaukY/nJBgUkj+30fwDfpaXR6GlrZuh+f9SYw88NgT91zSwMG+qU/8V2eu69P9js9OlBu9Io/IWvCBrzH/YSy76xg+bSnqeDtOeAFPaHEfWaDe4H7f80+PxDI4PCRaUHfW5Ot8Y8PUnA8ayhnHilQ7bKw8X+rTTHYk5saU3f89fJu38M1Vd0qaoN/afn49PHlB1aGee/D9lFIZ3G6evoyRUBAMDzNxwN2bwtS4QjvE+L6Xl2M4cQBpClzk4k8G2Rf9GX7R664NGoDlPOqUoT9A5hPVgVjKc9jEHcARSfdlcqfAEWM0zcf98Nf7vFQQRRrtw1cW40JaHRmw00R0P2CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8850.namprd12.prod.outlook.com (2603:10b6:610:167::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 13:13:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.018; Sun, 3 Aug 2025
 13:13:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 03 Aug 2025 22:13:49 +0900
Message-Id: <DBSTIFXLOTMQ.3TTS2O1PDIR95@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
 <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
 <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
 <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
In-Reply-To: <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
X-ClientProxiedBy: TYWP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: 15bf03f2-5868-4e8f-609b-08ddd28f976f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmdadVVTOThZdStGNjR6ZmdNY3BWMk9HZkttNVpvNitSVi9Xa1J5TFVuMDF3?=
 =?utf-8?B?RHJvc1NVTHpXWFJSaStTWUhHTFEvUnQ4cHBvQTRlT2hRSnJwSjZaQVlWcTYz?=
 =?utf-8?B?L2VKSGdyN0lyVWRIbS95UlF5OXlyS2FKZWQ1MHNuS0NjNFVHK2ZrdDhkaTlS?=
 =?utf-8?B?N0dsNUl3NWU3RXlJTDhTSDRkbldpcUNybzBZekJUWkpGaHR6VllLa1JxdSsx?=
 =?utf-8?B?d0Mza2NvRGZQeVY3NWYvbjc3SWJtOEtKa0lsVlpIUzZqbkk4OTZFM3lUMmMy?=
 =?utf-8?B?SUQrV2NiclczM20vMjh5UDRWWWVEeVpPRmtocGkzb090Y3FIcjZkY1RiNnVs?=
 =?utf-8?B?UnZ4bHRaUzdzV09LVVJCSDJuQUs0M3hTUldDZ3B0SzU0N1FkblN2UHlVQTU0?=
 =?utf-8?B?U3FDMWgyWHdEcmNEZ0s0aFM3Sjg5ckhOZkpHS3p2Njlwc0ZEbFdRazUybERu?=
 =?utf-8?B?M0Y1eGNCOEoxUml3R2xXZTVxZHd6bjFXWmRiYmpaN1JzSXV2eFlEQ0p2WlRK?=
 =?utf-8?B?OHpFbTZyNzlXVWp1R3Y5YUgxbWJVbStsVXgxRUVwYjc3K1dGdmViQ2tTUTVN?=
 =?utf-8?B?MWRrVGR4RG1CWmFuOVVDdXRRRy9iSmthYlpLMldaWTJDcXk5anR5aXkralAz?=
 =?utf-8?B?ZG5DQUtiUkxhblZuRWh3ajEyejJnNE9VSjNGTDNqRmVyL3VNRUdtZ3VjWk5U?=
 =?utf-8?B?aTN0Tk1hQjh5TE1UdktCR3NnMlpYVmszR2w3YzR2UUZkMWwwZ0xWeVJaREEx?=
 =?utf-8?B?Mi82SmtKWlVFT1JzYUc4V2U3eVhzajBCSDluZnRuNzVxOFh3SWI2Tms4OVhP?=
 =?utf-8?B?Rjl5TXQyQ1gvQ1JpbjlJRDBNT1JuYW8zTXBpUTVmV3B5bjhVY1UyR21NZzIx?=
 =?utf-8?B?SG95dzJhYjlhS2NOYlJWTVEyeUhWMW5PWkZ5Z0hxSGU3QmgrUXYvZ1c5ZmdG?=
 =?utf-8?B?TFpYRkYybXM5dnNFZmZhN0l4Z3E2bXhpN2FLQW9zSG9zWHVKby9FQVJlWFNN?=
 =?utf-8?B?MUcwQW04aWtsQUdzSUUzVitwK0NEWnlxaVU0WFlGZFZoWWFEVUl2U01uYzdQ?=
 =?utf-8?B?NnBkdTNra2d1Q2puNnJobk10amJiMFlrZm5oMHNXSmQxWjExVXpveHZtY1BK?=
 =?utf-8?B?VTRFS3BEZkY3TFc5cWFNMXZIVzBsSWZvYThEbW1qNm03eE9NajI3cW9ZbEFI?=
 =?utf-8?B?NlJMRk9MVmN0b29jQS9MT0FsME96eGVkOGx2K0FzV1JlUnFDMzNRVCtFL0Ew?=
 =?utf-8?B?V0kvTFpaRitadzFBeC93VnMwdWIxQjcxNWhJZE1jbGEwVzF3RjdaT3JLOTZC?=
 =?utf-8?B?NHpTcy9jaklnUFhoLzVUTURiMWc2dHh5Uldlb2crQ1k1aVBrS3E1Q2tOVTZ4?=
 =?utf-8?B?a3Uvbk9lTEZiQTNUNzlMYzhacWtwRHVxUUtGZ3VuMTJSMXE5ZG0wNXRLSitZ?=
 =?utf-8?B?N0RGV1VhdVVRVE41am55bmRUakpuTUp2NEprbEpBL0NQTDZKTkcwR0JYaWdB?=
 =?utf-8?B?SVVBMExiYVJ6QmlsbzlOQjkxYTVoc3VydThYRW12UmU4MW9vYU1CTVdSTWts?=
 =?utf-8?B?cmd0K1FiMHV3R1JoekdoS25ZY1d0QmZyUy85VUVtdmF1eDVMWUFKRGdqK1hs?=
 =?utf-8?B?RHNMZWc1UzVWRWJHNllkM2c4NXE5VlVzRGxoTVMxY0U3NnlFSFJva1ZNYTQ4?=
 =?utf-8?B?VXJUd3N1ODZ4QkdlclcwSTVPNCttNVc0cm5kek1QbHlVd05KSlluWUxkWVVD?=
 =?utf-8?B?dDZ5alhpOGE0a2JyRjNKbWNGdWRzS1FNVk41ZmxaNkZzR3RBdW5mU1BKWDNY?=
 =?utf-8?B?Q3oydGFnT3krcmlDaDVmdUdCZkVJakJHaXhIRVd1T1g5OEljSm9jTGRFamJT?=
 =?utf-8?B?ZEdMaW9xZ28wRSt1Y0t2a3IyakpjY25TM2ViUlAvbXVmSEJFVmtCRU9WNzZE?=
 =?utf-8?Q?EM4yWIHe04k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blNhVGxLaUtiZFFVVEIxN3VIYjZvclFOUGxiTkR3U0VCMTVveHNTMVVQZkxk?=
 =?utf-8?B?SzhiY0c0QWVmYjhhbjBiVWZrTERueTZ6cDVnZTdQY2hQQ1lDM2ZucEIzK3dM?=
 =?utf-8?B?aGJnZkFqTUJCZHRyNUVVR01GYlZKVGFkUkRhc3NjbXBYS3kwenpuenlVcFhL?=
 =?utf-8?B?THI3RjVpOW9CR1d4a2NwVzBhelFGM1RhZHNCMFdYb05Ud1VlbWhNeVJGckp1?=
 =?utf-8?B?Mk55YXdkZkttM2xRdHRQdWt5QzZMZHZnR3E3V0lwUlNwQjZDWEJPR3E1d3FF?=
 =?utf-8?B?Y1ZnNkVVeDQ3L3FEWlJ2MWZudzBzZHV3bGZsekRNQTg4bXFCclZma2R0NjYy?=
 =?utf-8?B?SGk5Rm1QdTVEZ0ttNHpMM0Z4YXkwRUxlMGo0T1VoeC9DRGRHU1hjQzBhUVEw?=
 =?utf-8?B?WDlzdWZjSysrN1JsK3ZBbkZ6emVscEQraG5UdmVWRUdYd0lYUmREQjA1OWhl?=
 =?utf-8?B?OVdlNGtJOVVXZHJVSHpCalhGbnJLcXdoRnNUUVVicW9KbjF1R0NyUE5Ud203?=
 =?utf-8?B?RFVJNXAya3p3MjVwOXliNis2WEdVbDJvZEovZWtQeFVVaVI2M2Rkc0NSQk1C?=
 =?utf-8?B?ODFTVGxQZzl3YVZtaG5yV1BzWDJjSCt0aExvZHdRYVJ4L1JmeUdUQWt2WkF4?=
 =?utf-8?B?RHBqSU5LdC9IK2dTSnk2RDJ3dDU2Y1grZnpMcFpyZTRRcWtuWkI4R1lpcTVB?=
 =?utf-8?B?RHRIMFRjeW0xUHM4aE04MDNhNldLNUliSDcwVkVWNk45SXlCSnV0RTR2dHps?=
 =?utf-8?B?SWQvbUFwNzZnU09nTEEwM3lWckN2MFpIYkNmaW1Lb0w2VVFtRndFdFoyY08x?=
 =?utf-8?B?Y2E5YVlJTWdmOTFJTkxxeWM3OXRxOC9KOVI1dThQMzNpUUFiWVJqUEJXTytn?=
 =?utf-8?B?K3E2VThabEhCNk5VQ1V5V1FtUXlaa1crSmNGSVBZbitUcmE4SFZOKzRFdnB3?=
 =?utf-8?B?bEpxMlBYNDRCd3RsNmY4ajU5WDJKbzNLWm5qYS9QVVJDVUFhMUQ2RDBQWGgr?=
 =?utf-8?B?ekgvWEIwMGZXc1VibXF2Z08veHlJU0NHZmpXVk5HOFhmSUxGWGtyb0ZaeEE3?=
 =?utf-8?B?Y0huTzI3STJMVmVKZWRER0lKaUhDdGRiUUFNcW13bGdqSysrSWUxME8rc1ZR?=
 =?utf-8?B?ZmRiUExhRFFOQnRqOGxYT2ZqaUFXcGxSQVE3bWZQc3R2Z3ZwM1VWaitrK3RX?=
 =?utf-8?B?a1FrY2RnSHRlNDRFYWMzaWJZejRiQ25aSGZLaWVHTHFxUmRDRGpNYUthd21S?=
 =?utf-8?B?SG0rQlYwWUczODFVYW02STJBck1pUW84cHhOWUYzdWIvNFRFeFNuMEk4L3lo?=
 =?utf-8?B?cVlsSmdscnBjbVk2aEMrdzFwRnJPU1RQT20xaU5VYzY5QXplZzhCMjN6RnI5?=
 =?utf-8?B?TTBMSk9CNTNMZHdXaUQ3TFZ1cUQ3VmJUU0lGeG05NEc1UDV0b2o5U2NtbHgr?=
 =?utf-8?B?MVlKVXRvTWpORUVtYUNuRjU3OHNUTXJZdkkxUTM2SlFYdTFxc3hOdFZzcVlm?=
 =?utf-8?B?aXkzcElrbXBLTi9XbCtFNUdaWWZDcmwwUVFOcWc0UkcvN2RyRWdpa2hmS2tL?=
 =?utf-8?B?cmRoU0JLRmFzOHBhVUhmU2RwNXduRDRva2tmakVzUkt0SmpRZmxYekNIM1lR?=
 =?utf-8?B?S1A1YnBlc1d0S1A3S3cxNXBQY0c0ek91Vk9NKzJUTTk1RWRpd2l5ODdtQzBV?=
 =?utf-8?B?cnA5Wlh4K05WTy9jU1RxUytEZGFJb2p2WTczNlNBZUlQSURCbEt5QXVLY2I4?=
 =?utf-8?B?YjFPK3Nsa3BvbFZrYW1ONitRK0R4dDBnUXYzQnB1cGNva0Z5QVAycm5QcVNn?=
 =?utf-8?B?ZTJGYjd0UUl1SjlYaFVlcXUrRER1RGplZTdRYTl2ZmtBenAya0VnaEdqeE5S?=
 =?utf-8?B?eFA1NURQK2xud3o3RHlOb082TmpSMDYxeUNoM1FFWlgrTzlURDd5VUg5R2tW?=
 =?utf-8?B?OGk2UUpzSFhzNTBMbWxoZURNK2dJajlYRC9MdHI4UkFpZXNKbkZocTRyd2xE?=
 =?utf-8?B?ZjJaeE54VUpOcVo0OE05YWJvdjlrMEdaMmd1bVZHVHd0VlZGa21EbXFyL2ZM?=
 =?utf-8?B?MkNLY0x6ZDhhZWNPbG9BdGdld1BhNGhEZWZyNkU3Wm91RWVDaTRPcEp5S0ti?=
 =?utf-8?B?ZnRna1JhRHIwUkNQNGdLRElGbG1xOXB2aFg2L2F4RE5iMFBQSE0xQ3hSdFhB?=
 =?utf-8?Q?tw6o7Fei7cP/5mIjyyY7VgIsKPPs1vn6Q1nzA78qDlXv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bf03f2-5868-4e8f-609b-08ddd28f976f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 13:13:52.2687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5PSHEW1TLO5jHtcHDvJGjHVANdDkaB8qDKs90Ro+QpL9WdyRCLQW1AbtVkXq/fSwdVPRkaR1Do/jksJJ733pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8850
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

On Sat Aug 2, 2025 at 11:18 PM JST, Miguel Ojeda wrote:
> On Sat, Aug 2, 2025 at 4:02=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> Belated thanks for the suggestion; I have finally opened an ACP for
>> `last_set_bit` (and `first_set_bit` while we are at it):
>> https://github.com/rust-lang/libs-team/issues/631
>>
>> I am still entangled with how to best leverage `Alignment` for our
>> purposes, but think I am getting close to a v2 of this patchset.
>
> Thanks for filling that one -- linked now from our usual lists :)
>
>     https://github.com/Rust-for-Linux/linux/issues/514

We got some interesting feedback on the ACP already. I have been pointed
to `checked_ilog2` as an equivalent of `last_set_bit`, and it *does*
indeed work well as a replacement - with the caveat that the name is
not very natural to me (or anyone familiar with the C interface). Is
this something we can live with? If we decide to go with the existing
standard library method, how can we make sure that folks looking for an
equivalent of `fls` find `checked_ilog2`?
