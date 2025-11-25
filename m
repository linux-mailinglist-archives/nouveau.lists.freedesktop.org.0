Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D1C85938
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 15:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4556210E40C;
	Tue, 25 Nov 2025 14:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lsmBG2Du";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013060.outbound.protection.outlook.com
 [40.93.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B99C10E40C;
 Tue, 25 Nov 2025 14:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdELYXOgIwmTsxiStEIFlstjjvOBVLeof4dxXX+qdHVBOSU9g86L9/GV1ps0B97JpCybnweP/IU+OWz+/tlKqhENfJeunK39s7CPGA/V0TKyOTkg2T3LQECIil/IUCOduFFMVFrcT6UST/8D5f3p9gXxBH4GJKzrUJIO2mWXs7KdGH/xQZZdpP2aV8TrcD3pOhy8JKy2sDHnri2RutToV/Pp17+Jfj459A8ecWe6nAZ+Tr+W+whLK6H7dcUm+8ISrq6lZsdHtTRHwEWIYCBqnCBoFfm+LC3kesLqI+1ZfCOBDPHSQkOCo69fS45wMqmT0hzefPACS1Zc0ceTcCdHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHVkeBTsyu27Q/Uo/+UsU24kR3S5qbZyNgHSGcElqFM=;
 b=nCAeOMzx+Wqlmv3ZcH7v01gV+67SPz5Hffzcn8zlwVgVAwplkT0aiw5KG19+nREq1FxbZr1QvQCiTmT+9lUEeX6eE3Wwn2jZq2US+VvUh0RgP9pZL7zhYA9l22YXyJnoiE0BhtlH/adAr1wITKrPgWW6MlQUplUrbFNZuDHB3HgPUS30LyWu1WzIPmJgXi3H4bX30MtMJax9PYlYIg10M46H78p3vvvgbiJLl3nq3IAlk4JxyrMKNboRuHQNKMA9tEZXETv14+sj7YtFZPl3TwVBY40NCX5Axk+g6SlzS1bc4RjK6CsDaadYA55TEsxJqrL1BrWTAiztdsu3sFfSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHVkeBTsyu27Q/Uo/+UsU24kR3S5qbZyNgHSGcElqFM=;
 b=lsmBG2DuspjYJoXBclfkuGUdTTsaaCyNDGVojOJRM7VlLOGble/a8S/R+QPDUw/IQ80YYB3I3xgzJf9hSUARgz4vKPvIX2NdiCKVSVfMhjyLb7dWI+ClWmDQT5mpsKvcAzXmnSfxQxwUu4NqOH+N8rPTfRj2kfQJNy2Li3GHY+tbae5Y8lJ2eJcI2PRRMSWIFcpn3aO/+VKnqHcINfhOtGJxwWuwlF5Wz0cOjpPRKBNBsMLqrFznTV60Xg/pQTd5rvXfS+5mPZz2IURhep/0nPeV3GAYBtmgzExpDlo4h3xeX7Fvvg20hT1DKgOnAPhw8i9FwZ36BtHpWbzQh7NK+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 14:55:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:55:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 23:55:08 +0900
Message-Id: <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: <bshephar@bne-home.net>, <dakr@kernel.org>, <joelagnelf@nvidia.com>,
 <jhubbard@nvidia.com>, <airlied@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <brendan.shephard@gmail.com>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
In-Reply-To: <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
X-ClientProxiedBy: TY4PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e026447-86b9-4726-ed3a-08de2c32a204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUIrMkNuRjY0RnBObmdEZnZtM3VTZWlqY21kNlMxZWQ1M2JjaE4zNzRHWVhr?=
 =?utf-8?B?aytVYnROemJCUmpVOGp3RHVQQUtKbTBORFZ3ZVF2aHBXVTVDb1ZsQUl4K1lL?=
 =?utf-8?B?a240aWFnSW5MdCtWRlNQZnZSRW5JQ2xyNEN5RVg3ZnltYmo3RHJ2Rk9VM0l0?=
 =?utf-8?B?SlJaR09TaWJwb3RmZ2RFeXQ3M0FNYmtBSUcxMWVTQ3E5NlpyMllHOUpsTm4x?=
 =?utf-8?B?S1pzV0xlUWx4M0IrNHBoSHRjUmJPeUJsQktvMXhGTkl1UjFhdGhjWHNhUXdy?=
 =?utf-8?B?eXBOdFlCdXBmbXFYRFdEZjlsSGFJY2VyNEtsNmJGa0c2RWxNT3BWakh4ZmlD?=
 =?utf-8?B?ZEowK3RaTE9zSzc0OU5HWC8xVWF6Y05IN3IwM29ncXJsVEpBajNwTDN5dVBK?=
 =?utf-8?B?MUFiYmVpYjRnRFMwTmdOaUFpMDFjbUo4Y3lFdy9DekN2NUJ0Y0hvKzVLeC95?=
 =?utf-8?B?dGdMdVdpS0NzOEJMWGxUWSs5MGlUV3ZIb0ZYYTJOSzZxK09pSG15eDlUV1JY?=
 =?utf-8?B?MTJoenluRnhuemdNRjN6RTFwbkkyd082OGpHbGVSM1Z3Z2VCMFUxOHQ0V2VM?=
 =?utf-8?B?bnBGbm1zM0lXdERyd3dOTkJGQm5od0cyT0JNUmdCTkFhcVdUdzIwalU4eXBR?=
 =?utf-8?B?M1hTWitqYnBRMW5DOVhYUVgramtnazZLSmV0ckwzcklxNEYzaXhXVE9JbUhW?=
 =?utf-8?B?VW9IaHpMWVpkNjRONlJacExhNDQvUFRkam8yeDBEM3hVRjVJb0hwaFVqUVlP?=
 =?utf-8?B?M0xuNXJhcGJhS1hMbjh2UWxyWDJvYmpZMGI3d2RjWjNCdFJwbU0rRDZ3SElX?=
 =?utf-8?B?eWw5REFsak4vOTAyQUwxR01ieHB0TitsemZueithMEkybUU0VHh0K2hqZkpB?=
 =?utf-8?B?UXVlbWRTRG1YZmpIS2VxNFc1MXBCSDlFY1VQempzaEV6dGpENWkxZjgvSk5R?=
 =?utf-8?B?bERSUU1Lclh5YmVmemF1Ykh3MU5mcEdyeWplczZ4bGdaRVk2cHNIL04rYnRt?=
 =?utf-8?B?SmVZeXliWUZyUmE2ZEVMeGZMYW1uU0VScXMxSngyU1ZST2txSG5ZRWx1V29H?=
 =?utf-8?B?Y2VhNFM0Z0ZPY01vaG4zMURZOExjTWJ6TE4xUUdsajJVWW0wY3h1a0llOVM3?=
 =?utf-8?B?cUxKcUtqTUEzOXVsTTZhZmd0SnFzdERKbDdNN3ZxZm5EYWJLZ2ZUNVY0ak1V?=
 =?utf-8?B?dU01RDRmRlo4ZmpXMkZRRnRMWklKL3Evc201UnNxNGtXYU1yazNRc0xlOWZl?=
 =?utf-8?B?Ry9EVml0c09aYWFOdlN0R0pyd1lOemVLdFVoQWZBWUlLelV0KzFEWWE3Q3Vu?=
 =?utf-8?B?UlRlZDNnbXFCYis2a3RiRzFnVlBhVVNMR2g5MDVCYW5la1FXc2pIYldCVWFy?=
 =?utf-8?B?ayt5U1VUWHJBcHZpclQrWFl4ME5HOC8rMy91UXczL2xnK0liNlhQTmIzeENN?=
 =?utf-8?B?UVBoMDQ1YWtCMWQ3UmZ0Z3ppSitxTUhhVlAwMlRCcXJTWlZEdEhRTnlRTHlX?=
 =?utf-8?B?MEVHOG1pbDBUZlVTVjYrcWJvVWYzRTYrWXY4cnpzMnB2Y3d5RERuWWx3cm1E?=
 =?utf-8?B?N3dGekhoaWZSQlg4aGszcHo0eGFvN0dIM0lHa0V6WGFIR0JkWmpad09CTVBX?=
 =?utf-8?B?NzBkY1ZMajU3NjZFQ2ZvalhkdjNiaVJuZTFKVlRZTkl1eGd6RzkyU0p6T0Jz?=
 =?utf-8?B?dDJDYVdsMGNac3BXd1l0SHNjZFJVcnBLRnpQY1dFdVFpSjRNTnlBNWpxSU14?=
 =?utf-8?B?RDYweVNiSjQ1TkJQM1pYR3p1QnV0WndUY292TzVnNS9zcVB4bXdHRlpKLzFz?=
 =?utf-8?B?elZkZnVLRHJSc3d5L0hiT0ZxNE1lY0FJTG5Cb1hmeStHSGMrSzhVZkFpcG92?=
 =?utf-8?B?aGM4Q1dsS0dhNHVJaURqcTB2N0JMbWdYbCs4Vjl6MGtGRGc2R0NQQWpQTmVx?=
 =?utf-8?Q?tBBWgsZj5U+z7pPC6zYyooJH/8DNDxoX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdVYnQyVFhoZ0dHaVFOMEk2dGpJeEs1L0RKalNmcHZRbDdlQ2ZzYWlFNCtG?=
 =?utf-8?B?ZEJnNkorY2tJZ1FWRzhIQmpqWThnZVRtUFhGb3VaKzZ1L01QUisyeEU3d1ps?=
 =?utf-8?B?SC95dWlrVHBqYWRjWXVJaVJ0cXRXOUc1dDIyTzJuZVVFTU1qUTU2ZWpkc2NL?=
 =?utf-8?B?dkFMYkFwR2JzZEx5d3llRXgvSlpDdTRleFNBa1RYYW54REFKdDdGNGZRanNT?=
 =?utf-8?B?MkJ4UENGNlhWVjBDVXllOC8vZ3NncURXOFpFbHMxMmc2N2RNd2s4Qy9iYWk1?=
 =?utf-8?B?NDlzZDl1Wk9Id25NY1NWeEQ5R1BpZnVYUTJTUFVqY05pN0I0TUE1YVk5dlpY?=
 =?utf-8?B?UjJJZHVaRzk2azFiWWlUb0tYbzI4U2daUjJZeUQ1dXY3Y1Z5UnZQaWVBYUg4?=
 =?utf-8?B?V0YyaWtwdjBVZ0lZRzV6RERUL3pHVVJjRUpCenplc01NbVZWTWdqLzNkcDRp?=
 =?utf-8?B?NXJRQ0wrMzd1YVhzNHBaTXV4S2dEMk0vN2hDTjZtSG8vbTNEV2JHUHVINGEw?=
 =?utf-8?B?dHNNRldFS0hMVWU1SWhUaS9ZdlE0bkpDQmpsY0twUTJrVVZsd0FRVC9HdWtR?=
 =?utf-8?B?YlROTjZHcGRWSUwvZCtoLzZjWGhBTklPWWNzOGFablR0amoxQWZ1TVBaT3FK?=
 =?utf-8?B?NURRWDZBVnl2bXhuV3Q2UTFrTHRiRnoyNC9TMy9IcE9lTU1pdWZhRDNOZmgy?=
 =?utf-8?B?T3ZHSlI1bVptdnBpa2NkWTMvakNKcmVyeWpBWW5oQ0lsUWV5anZLRTZTNXUr?=
 =?utf-8?B?S2hTYmkwazFpcm85cGVjYXkxRmRvSFNHUGt5MXE3dEM3dlQ2TnhBVmNCcEVC?=
 =?utf-8?B?TkpoLzYyUmVsLytlNVE4OHJ3NTdVS1gyamRvb0luczE2MkVTUGVMRE5melJ0?=
 =?utf-8?B?V2huT1FIYVh0Qk0rS3BGYnN2MDgzbzJpS1ZwVVZNUHFTbFJNWmFWUUplMjJN?=
 =?utf-8?B?bStWb254UTlhUmt3Mmd4RHRQZnRPakxjZjVoVUhSYVZJamRFWHJwLzRLRDZG?=
 =?utf-8?B?dy9kd2dTK2VyZ2x6ZlRjNWpVTnkrdXhuM1dZVjZoQXpWdGIwNnJUMHZTcEJi?=
 =?utf-8?B?YWI1aGJSbG9LdTllN3JTdXgxS2pNN21EQXN5cGFXRk1YTVU2RFV4ekI4WDVZ?=
 =?utf-8?B?a3ViSVFQenhtV0xGWWF5QUF0U0xqbVFJeW9aMjZiN21LSUR6bURTTDdKZ1cz?=
 =?utf-8?B?eGMzcW05Q3FCT2wvb2JQK1ArWnNldkJpTjFNczNMNnJRMkFMRk55THNlcW1G?=
 =?utf-8?B?TnIwUzBWRjJVLzlKYWt2WHE1ZVBLVUljMHlDbGg1Um1za09kV1FlZ0JQa0lO?=
 =?utf-8?B?NHdiR3JvQnMyWGc1K0pkWFI0UjBxZnZwK0lndE1PUHg3UzNGZVVMS0NMOUZ2?=
 =?utf-8?B?c0pyd0dIN2xGUVJOSzF3aUNxMDNLN2NWVDRMb2hqYmFaQ3BUdUJ4Y2lLUHJT?=
 =?utf-8?B?aHdUREc3bUg0bElraGhZdW04MEF2QVJDVXhzOEVXRE8zcnhCbnVJUlVnSSth?=
 =?utf-8?B?NGNZK0EyUW44MjRta1NGTFNubDJSWVNvaGdaeHhSdUx3eVh6RkMzRVFsbjQ4?=
 =?utf-8?B?S3dkbDUxYVRxU1hlQnNTTU5wS3JKUE9YQnBSUTkxZUdCRHQ3MGkzNkFZQnp2?=
 =?utf-8?B?Sm5ROHBxUTFYckE2bVVHNENOSk1vOEhkYVVJRStoMm5ZQ016THlBZDdRSVRm?=
 =?utf-8?B?cEdLVDJDbnhYR1k2dHRURmdZSHFVSXFWYnp6RklYSFprK00vOHNLS2dkc002?=
 =?utf-8?B?MnFIL0VNSkNiWS9ZanlWOHZpaXh0M2pORUR1WXc4NDlwYWdrcVJjY2JGa1pr?=
 =?utf-8?B?VWtsZmFHb3ZWZUtNSzZrWUg0S2I2c3Naaks1L3pLZnJ5Z2pVM3NsVzQvZ21W?=
 =?utf-8?B?aXd5VGZxWjA5ZzQvWlhxVUIxalZlWjZkclZwdUtSZzd3WldGTzRUc2FTY1VK?=
 =?utf-8?B?YWF4TmhmSEw0ZVNoTnJRZEhaUXVIbnNVcGRzQ3VQZDBYT3ByUlVQeXVZdENT?=
 =?utf-8?B?RVFOUFVyb3R3Q0drWDhTS0tQV0V0UHY4c1UrTFAvL3VldUVoMlBDajRvVVAw?=
 =?utf-8?B?ekFabHQwcVNkaTZNTnRzNCtJaE04UTQ1bVMxTHkrTVYwYk9vRitpZUcveG8x?=
 =?utf-8?B?RFVqNkdwd1JYSjFNUklrWUhVdDdTRWhkTjY4SGVlT0tocFRXL3NmYUIza1Zy?=
 =?utf-8?Q?e73TnG/OKsf8OmQSvSWtSoXnHyenblD2bMHakWCjR44L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e026447-86b9-4726-ed3a-08de2c32a204
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:55:11.2602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjME6hzCBF4uwbbbwI9tu7ayxrsktQw6IlwaRHE45D6n327pUimbKPXIRU/Zzx2j0SVQwWm6ywxHjLfotW+kyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
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

On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
>> > Use page::page_align for GEM object memory allocation to ensure the
>> > allocation is page aligned. This ensures that the allocation is page
>> > aligned with the system in cases where 4096 is not the default.
>> > For example on 16k or 64k aarch64 systems this allocation should be
>> > aligned accordingly.
>> >
>> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
>> > ---
>> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
>> >  1 file changed, 8 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
>> > index 2760ba4f3450..a07e922e25ef 100644
>> > --- a/drivers/gpu/drm/nova/gem.rs
>> > +++ b/drivers/gpu/drm/nova/gem.rs
>> > @@ -3,6 +3,10 @@
>> >  use kernel::{
>> >      drm,
>> >      drm::{gem, gem::BaseObject},
>> > +    page::{
>> > +        page_align,
>> > +        PAGE_SIZE, //
>> > +    },
>> >      prelude::*,
>> >      sync::aref::ARef,
>> >  };
>> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl Pi=
nInit<Self, Error> {
>> >  impl NovaObject {
>> >      /// Create a new DRM GEM object.
>> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<g=
em::Object<Self>>> {
>> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
>> > -
>> > -        if size =3D=3D 0 || size > aligned_size {
>> > +        // Check for 0 size or potential usize overflow before callin=
g page_align
>> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
>>
>> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - well,
>> I'll admit it looks better as a placeholder. :) But the actual alignment
>> will eventually be provided elsewhere.
>
> What about kernels with 16k pages?

The actual alignment should IIUC be a mix of the GPU and kernel's
requirements (GPU can also use a different page size). So no matter what
we pick right now, it won't be great but you are right that PAGE_SIZE
will at least accomodate the kernel.

>
>> >              return Err(EINVAL);
>> >          }
>> >
>> > +        let aligned_size =3D page_align(size);
>>
>> `page_align` won't panic on overflow, but it will still return an
>> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
>> you return an error when an overflow occurs.
>
> The Rust implementation of page_align() is implemented as (addr +
> (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
> if the appropriate config options are enabled.

That's right, I skimmed its code too fast. ^_^; All the more reason to
use `Alignment`.
