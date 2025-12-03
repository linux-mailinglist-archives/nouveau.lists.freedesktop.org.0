Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A915C9EE7A
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 12:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E54A10E052;
	Wed,  3 Dec 2025 11:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cs0eqsJN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C0410E052;
 Wed,  3 Dec 2025 11:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZ0nopgb3LvHPXIaH/Q0SeK0ArPw4QopchAia6mUNhmBqzqMtfuIWPUHi5D/PrdNSWFLUC77crneR+RoqFc1bkE59Z4/1uEnpz13w7/paOlpxAKNM0LpBsPwBpuXS1V48g4RuyAyuC9WJnOF9dvM5IK7Dzy6u8QNNNI6VNAFEaVX0bdjjCixablaGqWE/EgE5rAOXEeUsF8jhSiriG9tmWHpXhvuQH5GJ5ZDm8tnfynjg7yI4neHlL8wXVL9R42piMuhG5PCkJPAl82YdW7focBr5iZCfySijJHw1HtEuMGLsKPKyY6uAhj/zors6lOdCJHsQzNnDmA3VHuGSYi9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J9X3JyABGOK/58fXUKrxbBiF0cm1UcbKVZc2gCpvrM=;
 b=UxFRDtBfygC+dqhhFDoMgF3kESAtZCXfNwJCFCUkUnQWT+2LaCnYc7BKmVmv7/B/tLZwm8Mlir0hR30FQzBLhyYMgMDA9IyXtvqnHxbyOgRAHQtdyxft0ZISJr7K4nlRDTeuNhhzs6QwstOKPCwcqwIkBte/Ec+043w3sPRPN5nz/2Ed17j/M2LJiyPUfwqGLbBCsfXJ8r5x2Um5s9c/xycjBsl60c82EpVk19aG2L78aEN7Qwplkd5shqBQD//n3ENj0ryutN7F7wcBrf3cly7zVfod4hR3kcvH7K5PuA9/zjLgcDLPnYJX22kPj1vnNUOe2Yrm3QpfYuylEJNNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J9X3JyABGOK/58fXUKrxbBiF0cm1UcbKVZc2gCpvrM=;
 b=Cs0eqsJNdV5vzyBG+8W/01V6oujuFHN6KSt/o2TC9tA8Lgeau5xi0ul4BkIHLSJ+sMBgGQzEW8WEENJSbwLbouSiJrxiz6veqtOCNFStCUjeiDEV0JHBdSqfOYVFWQ2biwbzfE+4/FYxhkVtH3JlMJH9b4+f1YyyOh6zckWD7ETYq4C1H2uL0C3s9XM2F1MN1uKzdLR8VBiPnjLFka2Lr0Tu1K9GkyQRs8tg8H8jtMSBUrGLQR9ChxioprjG7h9RrQC2cXjE/kXsfFLLubaRvFjOzmkfL0STARu1TUpCZQXJhSgewHQOcIYTCX4Vn62c+W42vI8GhK3FQC97KagSlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7679.namprd12.prod.outlook.com (2603:10b6:8:134::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 11:54:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 11:54:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 20:54:31 +0900
Message-Id: <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument
 size must be page aligned
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
In-Reply-To: <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
X-ClientProxiedBy: TY4P286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: e37bccad-182b-4720-1d63-08de3262bae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SSt4VzNGd0lJWWJaZnJzSUFEZWRNZVptWTN2ZkVtYUErOGZYVEdxMFZFM0s5?=
 =?utf-8?B?RndzUUtzTHFHZFNnN1J6Z01RQmZLVSt5WlhzUVBLOU1pWnhCRENlLzBtU0sv?=
 =?utf-8?B?ajN0RGI1aUxKalduU08wdG5CMlE4Z1RrVnM3R2FkNmx3S050TzNWdXZEa0Vw?=
 =?utf-8?B?QnAyZzhIQW5pQ0JMelhaSGtjWEt4VVhocWk5WjVrL1ExSU5YeEM0eUJ3KzI2?=
 =?utf-8?B?ejdUNFUwLzJLTWJveWE0Z2crNVY4QlVlS3RROGJxaFVrT29TTS8wdmorSUdR?=
 =?utf-8?B?VCtHYjA4ZjczYUJKQjNwVE5sbHVXZDN4RUoxYVdOU1RPSlRCaFJFZW9GSmN6?=
 =?utf-8?B?SzFNWElwOXdEM3p3bHpVTmVnMWZBS24wanl4NlBveEtVQW01MElQdTBIL3lE?=
 =?utf-8?B?cHRkYjVIa3FGUDNYNFgwQzJsZ2VDZGNydU1vOGR1NEhPSDN5aWdSaGJGY2F4?=
 =?utf-8?B?dmxFNTAxTHVWM2twRmxIY3BpQ3BUUlc3SWNBTzdyNzQyTmZaM2VMUHNkaHl4?=
 =?utf-8?B?N3NML2h4d2N5WlloaUlBaThkdUw2eXBqNkZKbTY0OTN3WldtaXBqeTYzRWRv?=
 =?utf-8?B?UjVGai8yS3ZQVU9BUzdPRnJDUjJGWkFQcDBQNDQrZnd2eXBIaDlYV1pBaTRC?=
 =?utf-8?B?NFBRZ1l2Q0dVZDlqcFJGR2dNd1NTMnl0S2c5Zi9JQjZvdnIwdWtFVlBST2pr?=
 =?utf-8?B?TUJZYUN5cFdtbzluLy9QU0JVdVlTNHBFSXdCYWZkNGZFS2Z1R3p5ZEM4NW00?=
 =?utf-8?B?OFRTb0tLN3NSbzBLcEczVzNxMmg5VWl3QXJqYmJwZ3N6QStJajY2NUlPa1k1?=
 =?utf-8?B?YlR1WUxGREpndCtLWFBadUE3eEQ3RGZNVVl1UnZVOHZPeUVZc1lVekNTZ3NQ?=
 =?utf-8?B?L1VheWpLK1ZOaVJDaDkxUkxOdDhGZTBiQVZtSEV1Tk12SEdaR1VuZE1HRE8y?=
 =?utf-8?B?V1FFNGNDSGRKYW9NcUIxUERzUDFjV0FKL0FwSHlRVks3UTlSdmhGRVNCQ2ZW?=
 =?utf-8?B?QkxDbEJMTzNhMmRZZGV3MFpabE85NTVUK0pRbnpTMEdBWWtrMFBnWVdLbHRv?=
 =?utf-8?B?WGVxY0w0L1I4R2hYSWFCUzNPMDBSSkJydU15S2hROUk5K0dsNWI1TkpUMGJn?=
 =?utf-8?B?b3dSdGY2Rk44ZTlSM0FaK2RxZzRhL0MwdTBhOTJCSjQwVzhHemlnWVBBTllY?=
 =?utf-8?B?OEdBdE02S2hHalpWU1ZtMHRMVlZQQ1JyS3N2WmVKdlZKbGdKWVlScWsrSnk5?=
 =?utf-8?B?cVNSTW9FMEY0L3FBSUVROVc1ci9vQitDYllZMnVCMmUvdFUzTFVHMGZYb3Fm?=
 =?utf-8?B?RnVoR1Z5UFluSDJOTkluN2IrYi8vdFAvbVBSOW01aCsvV3VEbWF6enBtSHJ0?=
 =?utf-8?B?eG4xcGRRK0o5bTV3cHBaUHh1MHhYY2F2TmhVRm9xRHoydWRJUDZRbGsxRmdC?=
 =?utf-8?B?a1pIYUhOVDNoR01KTVhPSHA2WC9ORk82MmZXRkYwOUNnTksxczhNUGZWZUMz?=
 =?utf-8?B?aDJJOXd6WTgyejBxaE4vUkFFQVhTalV1WjBIQ1doaWU1ODJ6ZC9hZVEyWDRs?=
 =?utf-8?B?L3J1TTBseDg5eXpaSmc2aDZwUDhzbTNrZjFqK29pVmkyNVUvWkYyUnZrdkc2?=
 =?utf-8?B?dHlxaFozZ0hVQXp0TzVnMFg2eERYVys3blZjMTJvb29hZnJ5eVZxbGIxNlRN?=
 =?utf-8?B?aWdYL3dOMlZiUEYzQ2xOWmp5eUJvM3k3WEJXWGM3TVVrNmduaHRGK0tlT2M2?=
 =?utf-8?B?Y3VFNmlpajY2STU3VXZ2OHhadHhObXcyMDBJbmlXUnVFcTdDUEpXRTJDUzFF?=
 =?utf-8?B?TFhUQTVMSjgyQkt6YjdaOG9vNVRrMjZBL251MHdRVWkrc1ZCbngxY0g2UWhw?=
 =?utf-8?B?YXRic3M1SUFheEJTSm9JZmxJU3kzK2d4Q0ZKRlRaMDRYRzhKOFZVd3NPdnps?=
 =?utf-8?B?VWUwa1JhUENSMDVYSWt6VnY3RHBJdlFuL3NWMUJFdEZnNW94Y0pxMGFrazJl?=
 =?utf-8?B?T0pXdm5JcXBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVE5YzM4SmQyUWVIeWF3aEZjQkxvQUVSaWp0NjNmL1R5ejZvWWpuV3dZU21O?=
 =?utf-8?B?YTFCYkI0N0FzQk8zR1loMVg3M3pVeXM2Q2pHQ3dhUzJGVEJEY2dUSHNNY0Nu?=
 =?utf-8?B?MEhXYWc5Wk1hUWNJMlcvc3ptQ1hOa2ZsUGU3VE8vRzFGOG52Wm1ob1RkZk11?=
 =?utf-8?B?VlFadDZQQkhqUTBSYTVJeDJrS3hDbmdpeHVhMVFCbUgyd1IzNzFlM0NpUXph?=
 =?utf-8?B?Rkw4T2prK3NXeHRnWnNnYUl1bTlFd1IraCtvSTJ6MTZRT0RGd2dzZVMwcXdF?=
 =?utf-8?B?WWNETUxBbnE1allsQ2xCWjV0MENpT29HQU9OQXZtaWxjV1puVjZicWt3MDRx?=
 =?utf-8?B?WlBRNExvSzBTSm5mV0hXQS91RXliMTVOQm9HNUY4NitDZ09mcmNvd2VSTG9J?=
 =?utf-8?B?eDZuVUluS1FKTnA2ZmdPNkxyWmtpbi9FRUhWdU1SN3U5NzAzQnMzRStpbHdW?=
 =?utf-8?B?U3N1bzBRR2JsbDhZVENMYnUyWVQwcm5mazZoN2laL2lOZ2x2K1ZpL0NmbmVm?=
 =?utf-8?B?L1p0NGVoRjA1SnFtS1d2cnhkN2xZQTZ0VHVRQ1lzK2pkZDEyR3NFbE8wQlpt?=
 =?utf-8?B?WFhpVDNTWUcrNkNTY0pIc1lsOGdRRzRFMUNaZWY2UTM5YTBRTHNvRVN1dDEy?=
 =?utf-8?B?TVkwUVlza1U3NXB0RjM5RzJOMCtaQkppQ2llMFBLMzg0bkx2MStRUGpRNEJR?=
 =?utf-8?B?bkkvdnZyclJrMW5NWHRvMGZJckZzRGRlakdZa2lSejZwRG5GY092ZnMxc3dW?=
 =?utf-8?B?MTVxUzFxZVFLZ0NCWkpNcEdBVWdIeUhHUEZiWVRmVEx4Qlcxd2tXM28vamNy?=
 =?utf-8?B?SlNhU1ltcTZoYmNIVWlFVXYvV2dBMGdicWdBQWtwWE0wckdpNCtLWlVRaVNo?=
 =?utf-8?B?aXhCVWNpUWtnNFRya2RnRGgxU3dHK3FCbG1tRENYSGZkRTZVZDgrWDNNRU1V?=
 =?utf-8?B?YjZEZW01ckx5NlBuM01BUG1TcnR5cWJ2ZEl4K1ZEblM2VElvaENoZVVBblVT?=
 =?utf-8?B?K2tLVE9JclpUNFVKNUJZdG5ZTVFscnVrQ2kyN3dmVXpFQ1hYZWpQNE9uek96?=
 =?utf-8?B?bmNIUzZKaGdtTmN2ZlZobnZjcUhYTjcvbXl3TTZybDV1bE5ObGlnTjQzSk9B?=
 =?utf-8?B?WmFQMUZNWFdsdUFzZ0NxREpnRUM3b0JOQ0x5Z1o4c1hWS1QzNHRNMXhoMll2?=
 =?utf-8?B?OFdpT3FnTEFOOWRFSUhOQktISlBRcldpbEw3TzB2d0gyQnhuU2VrYzlrN1B3?=
 =?utf-8?B?OHRDL2g2cERVK2dIc1R6dm12MXRQY1NrZ1p5T3pLeVBpSVhZK0g1ZWd2Y0Vi?=
 =?utf-8?B?Vng2RU01cEhZT2NTUmdrblFZSEF5OEhSMjRyRG9mRG5HM1JYOXpBZzlrdjlW?=
 =?utf-8?B?eThEZ2FjWWhOVGtDdnUrMHkrSGtMSVFHOFNEcCtxZFFDUmFWeCtDMi8wZWxO?=
 =?utf-8?B?OWx3Y05scDllRi9Ka3BNTy82dytsRWcyK2RETXZlQVc5Z1pGZ0JOeDlCTVVy?=
 =?utf-8?B?UTRBRUh4MXExL05iSSs3T210WXA0Yi9UVGNMeVJPcGFjQjBmZm8xMTBsQ2dj?=
 =?utf-8?B?SnV6cVBxTDgyczJuai9CZlc4MFl0by9SZ3pYb24wWExFVk1DY0J3RVRaUHVR?=
 =?utf-8?B?TEFTb0RBNXVxdjAxWCtsOFlPM2FYRnNZenduZGlLOTVVNVBQb0JNTGovUEJn?=
 =?utf-8?B?QW9qSmNxWCtCWW44MTVrazU4VXdrTWZleHNqM04rd1FESGZUZnBkQkFWNkIv?=
 =?utf-8?B?czFUQ0w2dFlvZFpkcnloYTNPaVdGUXFYMjgwVlJCMGFjd2FLWG9ETGhHOWVM?=
 =?utf-8?B?cWFwMDN2WnRGU0RVNlJlTkE0Mm5YQjJhWjFTSzJ5Ym00RUwvTWErZ1h1dHdv?=
 =?utf-8?B?U0JjcTkzeHgzSVhTakM3VERCQk5NWG5mbTFaei83ajJ2NzJnOTZNU0RDL2Rl?=
 =?utf-8?B?RUNhVDV2V0tzZk5wQ2Z2SjhONGFZNjY4Z3FPNDNWZm4rbWthZDc4TURiQlZV?=
 =?utf-8?B?WVpNV2ZlWHNlTS9JQVViaXMrZmU2NWVMK3Y0VHpJTXQxWFZlZnlNaUhQblRr?=
 =?utf-8?B?cjdVSExmNjlKK2lXc1hEcG5odUp6OGdmdlI4N0JBdzVpUU5hUUdQbEJMdUtN?=
 =?utf-8?B?OVBYUFFBTWdkZVAva283ZTJVREZkcG5sY1ZzcHhvQjFOVUhDNE1rZWNyQjMx?=
 =?utf-8?Q?TOAyw7LLMPQ97HbwFQX0Qgfybe7/goAXC5wdxKdKgMLt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37bccad-182b-4720-1d63-08de3262bae9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 11:54:36.0249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3fULrMzS8gDmFqo8J/wWW28uKSsDnyT4atqo5u68ryBiNvrnJCxTzuXhvQLDoycJhTozwLk3a7FZpypPo4y8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7679
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

On Tue Dec 2, 2025 at 8:25 AM JST, Timur Tabi wrote:
> On Wed, 2025-11-19 at 12:36 +0900, Alexandre Courbot wrote:
>> You can use the `Alignment` type here, as the rest of the code does:
>>=20
>> =C2=A0=C2=A0=C2=A0 let size =3D num::usize_as_u64(obj.size())
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align_up(Alignment::new::<GS=
P_PAGE_SIZE>())?;
>>=20
>> Now `align_up` returns an error in case of overflow, that we will need
>> to pass down to the caller by changing the return type of `new`. It is a
>> bit annoying, but better than the behavior of `next_mutiple_of` in such
>> a case, which is to panic. :)
>
> I see your point, but these are u64s that we're talking about.  The only =
way next_mutiple_of() can
> panic is if obj.size() is greater than 0xFFFFFFFFFFFFF000, which is not p=
ossible. =20
>
> I would say in this case, a panic is preferable to a convoluted error ret=
urn that will never be
> exercised, because failure here indicates a coding error, not an input er=
ror.

The input data is a usize, so technically we could get an input that
triggers that error.

I know it's a very edge case, and clearly indicates a bug, but the
general rule is: don't panic the kernel. And in Rust, if possible, don't
even let me compiler insert panic-handling code. If you don't want to
change the return type of the method, then maybe use `unwrap_or` and
`inspect_err` to print an error before returning e.g. `0`.

But others have already thought "naah, that's never gonna happen" and
got burnt very publicly [1], so let's learn from that. :P

[1] https://blog.cloudflare.com/18-november-2025-outage/

