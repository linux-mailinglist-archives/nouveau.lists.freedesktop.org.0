Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64C8BAB6FB
	for <lists+nouveau@lfdr.de>; Tue, 30 Sep 2025 06:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7323C10E280;
	Tue, 30 Sep 2025 04:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lBH3ifpW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012016.outbound.protection.outlook.com
 [40.107.200.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B655910E280
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 04:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOuulYki2dBzfoMFXZpU29QTLi0Ehen1ZTjMRyNcDcnqbaOOzm/dzLRjHVpPWrCmz4Qzu//Y72VPal4+6mwP22E4inHH9/VKkhTSNQ8uuTniZqHv+w//R1e/vFFi1B2IoHZJkMqRhkgmGfHNqlIRpE+7cMQexVLzGPElUxlBBCAhVCU9rYL7PmkuKNnX/LybIf2UIyi1LNZo2nQMsN2/h2NbGtxcOxyhMOUL2tATi/q2kJy6+TEz9rGwRLuiwfY0E8uyDDSuBZUTs4yjpAo1ZUNyDYEBbiy3/AkKzLvVRAPp8YYnC5kpwdURR2i0WgPnY2DOA0ARYbPSZUPxu/STWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygv4jmOT7P9Aj5T8QtAAylSVILtASNYXXpYbg3keAXs=;
 b=I/eCL26k//AoCVDlYXGcmNQDL5OUneb/eW4+29l1u4UqyJEhePuiEntYqAJnrvQI420xsOmRoO5PvomGBf3CNeD3HPxWZdFUIk2o8TUwIVDA+7nSIoOFrUXfTDhBRT9hbMXFogGlWD/MvtPG8pYZQBAqTC3H5dNZLV/pZyZnQf5GKth4ahFdkozOPMQzBplEt0PWK41lVWQtNh6GAYYEWJWThU1iXaFtll44zmO7tAkm6StFKTX3zdQn6xCTCt28KFFyLtYu0VBGinAroM5YB7DFat/NxU2oWNdlV5FZikTy6g7VcrrX6JMaAqht0XFhzvBA0Wg/ssREn0/7CPjZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygv4jmOT7P9Aj5T8QtAAylSVILtASNYXXpYbg3keAXs=;
 b=lBH3ifpWjgQt07mdjmeIpiCYu9InuEMJqc97ZQXscJocnM3uuwYtN6b7W5AnsY/C6IES3wAzUUAjl8JL5boZwsgSXJZjU3fMvwY6xvbSUVZzIcvxCEJENaKwelgYJyhfcsKIKct1XNGNrniEWdw9qJk5vcQOnEkpvlYa14YmhIH1Jdpcc7Kx6JsdHCX4q4dMhrVMReJvsdheg47Lrvpr2nYy0DxCT4R8gd+8D0GdmzZhO+g/FlPL+nG3CGYvKLI8x2VczwSBO9FwMFsCmE3tUJXpTiaoAzC3gyTn9z5ICVFMxrObEUQV//u4gqIB3hmPLO83WtOmioLAlE9o/H9ITQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 04:58:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 04:58:26 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 13:58:22 +0900
Message-Id: <DD5VAPG2QFWA.2A58AL13VHPN2@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
In-Reply-To: <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aeaf45f-c012-4653-f1fe-08ddffddfd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UENFSmlRQW5jb0ZBeHV1b2dJR3dXS1JNQWs2Tk84UFg4K0dBK29tb3BIc1BD?=
 =?utf-8?B?VmJ4YkM1eUh5STNjNU1lRkF2ZEFrRGhlL3hkbEN2alQrNUFsKzFVWHcwS3pT?=
 =?utf-8?B?U2t1NElkU09MdWMvb21ObU1UWUdQampIU3k1dlZGQlZxKzJlK0ZHd3piUkE3?=
 =?utf-8?B?S1lhemYvZ1BpRnNJam5JNDI1ZmJVZURCUml3QTJ3YmlFQUpNYTlRSDRsbjQ0?=
 =?utf-8?B?ZmRrbDVtTXFDVXFHUHhmVC9jZThlRG1lWTExWlhwZ2FFYW1YWTBXdFdIUGJY?=
 =?utf-8?B?bjV5a2xYNEcxbnVPZW9nektUcGt3K1ZLY3RkdUwrODFkU0M2RHhSdXNRUG5C?=
 =?utf-8?B?UHlDY2VRNUs0K2F0OExRdFJ1dWx2L3BSK3lHbVczZGNURThtelB2UkRvZGtR?=
 =?utf-8?B?MEk4SDdTb0FacXAzbEJDMjVGU2ZudjJsVWEyZUxsK1RVcGxUUnE2c1RyTjB1?=
 =?utf-8?B?Y241S1lrTnpuWnZPbFpoUkxpTHo1VVZ5K3hHcFZDamIyWDlxZEtaSXFvdk1Z?=
 =?utf-8?B?TitheC80UWN4NElObjFMREE3VWZVd1RuZVc0WXZZTEw5eEZOaklsNUFyd1cx?=
 =?utf-8?B?WTYrZDhMOS9vb2t6Y0VvWHd2MkhqM3NWSlRERzFSWG1hMnk3UUh5UWVDcHJI?=
 =?utf-8?B?Uy9zT1hWbnVPUVBtdVJGb0xwZnZ6L2xQY05CUE55cVhZeVBpb1FqTjdLWnQ4?=
 =?utf-8?B?MmoxdjlYcE9wOGpiZys5ejE1K3U5NXUxSXo1dnlGTDJIVkhuVnhRZjRFRTBO?=
 =?utf-8?B?U09JZHoxRkZJTXkrWmsxeWF3cUlzZ0NUcXYvOXJydkN4NDVQNE1IUnF0Z2NM?=
 =?utf-8?B?SFAwMmxxZWdvMGJNamcrRm5WWlNaSEMza1FGNlo2NUxpOE91dE1wQUNtZ0li?=
 =?utf-8?B?QjZEa2NOWGVqVTQ2TUY3V29nUWpEUW4zUVA2a0twOHhWS0hITnUzcnI2OGE0?=
 =?utf-8?B?MnJ1dVE3Y1JPWmtVT3VZSlpLVlB5cWFvUVVJdFhUcGVlYVNtSUFVbElLditI?=
 =?utf-8?B?QlhGOHRxcERrMUFhdTRMdW9WMy9pVUpybmJNRTNqeTMrUUVUMC9nbFExU1No?=
 =?utf-8?B?b2lYZ0FMYVFzVUFtbE9KOGNJN3dOOTMzMFBwZ1hEZkZDNnUrR3lHNHUxQWVZ?=
 =?utf-8?B?RkJFdytrUE1IOVJOa3RNUnVWU1FUL2xPZDBxNXBLeE9aT1F6NHorYURXMVZt?=
 =?utf-8?B?ODJncmhKRmNpVjVpajBMa0dKOGR1R1V4aDRleHF1TUVidGtxQVB1TnJtTU5W?=
 =?utf-8?B?blV2b29vWURaRXdQREZiNlF6cUZpSVFrL0ZjRTUrNU5jQ2tydVNuNDAxU0h5?=
 =?utf-8?B?Z2pZVythbDZJbDJmSXBabVJZR2JxdzhTT3BBUUZ4WjlqRWZzOFRUcDk4OGdI?=
 =?utf-8?B?N2Y1TE81ZmIwSHNjekN6NnMzSmdZQ3JRMTJIejViaG5rNUNXYWhtTVExNzdm?=
 =?utf-8?B?eGVsc1dlWFBldVlLZENoSE1vTk43WXNIYXN6THdCUHdGVzFLU3A5bEFLbUVD?=
 =?utf-8?B?SlNOb2RxdDlDYXVERitvRmdUQTAzcXgxdGk1REhQbWc3UlFva3E1cTNEYTBH?=
 =?utf-8?B?V2MrelIrZzhaQVB3YmRuV3lBb3QzN2JxM1huQlRkaFgrRFVZVVBKZHllQkJF?=
 =?utf-8?B?Q2UvckRTbytZQkY0QjdRNlpWRCtBRW42RmhOSHBXeFM5R0ZrWi9MRjl6b1dw?=
 =?utf-8?B?d1VUYkowb29VenByTklIa3dncHIrdUlEdDJFSWZWcTZNTDFVS0hybkJYU0N1?=
 =?utf-8?B?S2J5SStTVEtZdTdnZzB3Mk1kcUpGVTAzZ3FDcUVFckUvU2xBVlpOdi9KTHcw?=
 =?utf-8?B?MTNyWDg4Q3A0R25yUlpVVkJrcVNhZHdobVQxazlPbksrQ2lZWHp3MTFRTXlM?=
 =?utf-8?B?MG16Yks4dFB1azJpcUpGM3lKM0tOUFBueFNKYXI2VmxBeFF4a1RlNCs4Mjcw?=
 =?utf-8?B?TXhJaklxd1UyRmpRR2VVcUxpcVQxKzlHY2htaGdTaUNQTlhUaGlCU1lhTzlr?=
 =?utf-8?Q?i4fpOvfL6vzvpnjMGp6Lai3po2DtO0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wjg3OGovVGhiWmlKRG51RWozSFcvV01YNDJnSUFsZWFMUkFGUG9GUi9tVS9W?=
 =?utf-8?B?dXVka1FEREF4NWtCUXZFUDAvbmI3UStheFFndGI5aENOci84WXdPRG5BdzV6?=
 =?utf-8?B?S1dCT0pUU3VpQ1VDaWs3NEdWbW9nUlliNVh5cDFSNDdUL0tzNlpIL3VYUGNm?=
 =?utf-8?B?ellzVWVFam5vMjBHazEwNW1MNVNwNVZBL3FVQ283WkRLRWRmdmFnM2ZtVGJ2?=
 =?utf-8?B?bzVOZU1UR0o1SlJmNklTRWNJRWFOOXZZTmlJTkJkU2FUQUVvK21TVU5uVEl5?=
 =?utf-8?B?U3NGbFQ0ZEFXeXY5UDhhOTRyeXZEalFGMEJDTGNFaHh1aDBrZ1d1TWV1ZkJo?=
 =?utf-8?B?UFkyTkpmbUMzTEtOakd5Z05jTXhjakNKZnVhd2NUNVAyTllLalZhZlpKQTd6?=
 =?utf-8?B?cy9nM0xqRG5YcU5qTytSTGZoeE1QZDBXWDc4cHdDdlI5QVROcFgwNEF1aXRs?=
 =?utf-8?B?Y2hKNy85VlJhbjg3QlRhVmxTWE9sVGthWkZTZC9ZVEtaMlFvQjV0SnMxSmVy?=
 =?utf-8?B?Q1RhKzMrdFNRWXcwazUwbE5pMXlYVUpIOERsU3JGQ1JLV29iSWhwWGJlMitG?=
 =?utf-8?B?RUhpWktwenJ4T3pwUEo3ekdnSFpTK1FSeE5vMEpjNm92SmUrbmtmZjRLZmJ4?=
 =?utf-8?B?MW1EVTRsV2ZtNURYTTZNVnQzR2I2cC9ndW0xajZiSWtyUEtlbGw0UFVsOWcr?=
 =?utf-8?B?N3cyL3VaeDVTZ1MzNHI0ejdodzkwTTJHZGtyWDFMOVRqQWp2WXc1SlQybmRJ?=
 =?utf-8?B?UUtyWGU1aENQWDZPYnR3aEY0U0JKWkdBL2RELzkwQUtEM3d0ckZQZ2hHRnl2?=
 =?utf-8?B?bldpSUhHTHJmUFRiVDVEMnBLTUcvZU5IdHBVMUtrM3FUUG81MTJJbTZuaDhh?=
 =?utf-8?B?Yzh2RTZ2bTlCMXJtbHNlbm42aGZPTUdUSkRiYmxvdGJSZnhnRGFqZmczYTRu?=
 =?utf-8?B?NHpyQWZyYnJRS1FURmN3aWVheTRFYTY4U1N2a2loeTd6THlwYmUzb0NwQkJM?=
 =?utf-8?B?YkJva2xjQ3hCVFdQSlZuc202ang0K05KSm5NVFFUMEpBVnZ5K3pXN0t3ZmNC?=
 =?utf-8?B?L2Z4REtaeXNGY1hNT0x5eDg3amxZVkxkaEN2TVhjNm50NXllNXFBTmR6TWtr?=
 =?utf-8?B?dVhOVlVyZlNTb0w4QTlWZm8xOEViVzR1ODU0QVEwbHJkQ0svdzArd25KQkRT?=
 =?utf-8?B?RGdKYkYweUNZZjZIcEN2bHplL2pGMkRWRy9RaHlrYzVGMVovQ2ZreFZTdkhQ?=
 =?utf-8?B?Y2wyaE5uaUxXTjIxSlBNaTZjT1UybG56ZU5YU28wUVR1UWpvMG1wcXd5Qmx0?=
 =?utf-8?B?dFM1MFk1c3VkVWxLYjVLbXpZY2tWUlpYaGM1c3RVMEJ2T1lpZVFuYnJVSGUr?=
 =?utf-8?B?R3poMHlsSEtPTkd4V1pZS08vbFB3TjBuNDkvdjYwUE1GZlVmd203VW5HMVpq?=
 =?utf-8?B?akw1WS91Wlptc0djTDc1M1hjOUNpdFVMR2JIZ3ZLbjRjWWdld0QzMGRxWEFF?=
 =?utf-8?B?cFlLbFpsTzNKU2lWYVdheUNlaVlodXJrT3hrODFRUWNSUk81T1lKTU15V0c0?=
 =?utf-8?B?cFJuL2NkdzBRYzdZNENjQ1JzZ3pBb21YOVJTQTFXVGJvTjBhb1poTkNUK212?=
 =?utf-8?B?ZWZveEZ3dUUyeW1HdzF0ekh6aHRETkRST3UwdjgrYUJzTCt4VHdMQm9saXM2?=
 =?utf-8?B?THh2c1NOK1NOMGZRZVd2dXN2a3c4bVZTVjVVaWJsaDZxYzl2V3RremorWXB4?=
 =?utf-8?B?bTV2Q3hZWVllZkpPWFF2SEpUMXpMRkwxZm1KZnZZWUZpVEtDSkkvemxUYUtl?=
 =?utf-8?B?bzJCaDJqWVJHYzZESW1zdW9sMG5lVFd0eVJ6c3ZIdFhkYlEwL1dPN0FQeGZP?=
 =?utf-8?B?M1BpVmRwRUtvYjFlWC9keGpRZForWGFWS1JyakxsWVkyRmZXM29zQmZqWHhW?=
 =?utf-8?B?dTZZNXFURDR0ZWk2VnZEN2pmbDBwaGlTZjNJNW9ubTl0UE1DT2V5ZDlOYVBV?=
 =?utf-8?B?K2ZhSk9WZ2syU2FsRFFOSGhpd1BQRFlDbEJIaVZqcmhkS3owUUtSZk8zWHJ1?=
 =?utf-8?B?dVYwNmV6YjE1VGx6WjBLcFp5cTZ1c0lFOFpFcFZ2ZmtIR210ZVRFSjJhT3Ay?=
 =?utf-8?B?VmNaZll4WERVaU9QamJTbzMxZW1HcHRSWTNRanQwREhpQUxhVkRwZ2ovbEVu?=
 =?utf-8?Q?BCV994Pl2yGuwah1l8ujS2egTnUKFzrxB/ZHcF8Wrq1U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aeaf45f-c012-4653-f1fe-08ddffddfd35
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 04:58:26.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orjZ11ZG5qD80JG3WwRkBI15LArrnrTsLcxSCfXVk8afm59bfAs6h8Z2BxcQofhNVWU9GkO3JE6kI+ZrZwLKnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331
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

Hi Jesung,

On Fri Aug 15, 2025 at 2:32 PM JST, Jesung Yang wrote:
> Extend the `quote_spanned!()` macro to support additional punctuation
> tokens: `->`, `<`, `>`, and `=3D=3D`. This symbols are commonly needed wh=
en
> dealing with functions, generic bounds, and equality comparisons.
>
> Tested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---

Note that this patch doesn't apply cleanly in `rust-next`, I've had to
add the following on top of it.

I suggest waiting for -rc1 to be released and using it as a base for a
new version - hopefully this will also give time for more feedback to
come.

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 76a99f7e01c4..bb6970fd2a26 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -147,33 +147,33 @@ macro_rules! quote_spanned {
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident -> $($tt:tt)*) =3D> {
-        $v.push(::proc_macro::TokenTree::Punct(
+        $v.extend([::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('-', ::proc_macro::Spacing::Joint=
)
-        ));
-        $v.push(::proc_macro::TokenTree::Punct(
+        )]);
+        $v.extend([::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alone=
)
-        ));
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident < $($tt:tt)*) =3D> {
-        $v.push(::proc_macro::TokenTree::Punct(
+        $v.extend([::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('<', ::proc_macro::Spacing::Alone=
)
-        ));
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident > $($tt:tt)*) =3D> {
-        $v.push(::proc_macro::TokenTree::Punct(
+        $v.extend([::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alone=
)
-        ));
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident =3D=3D $($tt:tt)*) =3D> {
-        $v.push(::proc_macro::TokenTree::Punct(
+        $v.extend([::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::Joi=
nt)
-        ));
-        $v.push(::proc_macro::TokenTree::Punct(
+        )]);
+        $v.extend([::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('=3D', ::proc_macro::Spacing::Alo=
ne)
-        ));
+        )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
     (@proc $v:ident $span:ident # $($tt:tt)*) =3D> {
