Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67128C6F07C
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 14:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF4410E623;
	Wed, 19 Nov 2025 13:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aTjDhlzb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEEC10E623;
 Wed, 19 Nov 2025 13:49:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHW3t1os3Dd7Z4goVvc4KOR5o8Tx8iq9bv3ogbPqT5XvXPHVWty64m7gOj5CwsRfX4fdZGAkx5CyNswDL+jWXEdMv0g0AmgrjtpJ7SggMWSqRpejfvtdz1WWFHCN4ETI/Xc2JF/VqkXnbq/J58Ni1ynbBngE25qhPI00UO1J06P4h9Mu/nc2dyftONepi6wzO+k9auKDZSrjc6ubJiDq+4tQrQtDss067mX7xKdhDNfMsk4+ft3vOP51c3LGdQ1yBOl9Q589+LGxgq/AW1OkQAJV/2/MyFXOmBkw+FVw0Cwe7GldNrCdPv7oBpUCPrkBnqLevBFRB9okBkaFsm9j/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqtyLfwnb0SFch6+wmawV/pv9c2QvQnCRnjmbo3O5Hg=;
 b=pzvmfitGv8UDku8oNLX/USA4+AwBruRTU+f54xUPnKf3EHeSOYaVfaGpXSM82h2WQChoqCZoLRgO3sRu2ziHoBeCOT8H2zvsBI1dHrJi7RqsMKhERG/1iQZmuewJt11BhWAYbZ/GiP6TgLP+YuoFXtViqJTQoEzwWhUU43jvHBolWyVXf88dT6HAc2lleg7Dg1FoTY8xC1xWo9MKD1Shrx/V1FNb8f54aBgJqYegFh4B8NzTNqNvuNdZSpipndCSvenKEkv4JNdGBI8EjJafhJ09+Os1ZrOn9P9Xl5bZDRpc7S4UraUd02Kdx8EKwlE9+qNigjNemeduuOklxSn+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqtyLfwnb0SFch6+wmawV/pv9c2QvQnCRnjmbo3O5Hg=;
 b=aTjDhlzbLqvkbXLl9VrUXtSVaL8g7IlidbC/FA4UglCpka1RNBcfcf6bfA3acdH1OLvXxdXzounlJYoegQvqEWd9EPMfk6DFPzxSBC8OW9W73SnzW6wXOa0J9JNsxVs/UaIQLuN5gmkO3Ewc3/UKwE9veUUEHz4rujNj20on6rruvcHG6o6WFnb1KU54CJKlaxJ6ZmI7GP8jWh84Vr3Fl51Kx+xUaX2mkHd4eAtN0i89+8wFeuyRGWra8FwZlq2XE0TsRbhgm85nDuYbsQPIKbzpK/XC0k076ghl5NcNrkAT2Xhkm0L+fYx5sJdBPchp3Xw7E56wDJzFvdw0SJ9xvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 13:49:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 13:49:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 22:49:36 +0900
Message-Id: <DECPWOSM7LLB.22QTX32SYUQD2@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 11/11] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Lyude Paul"
 <lyude@redhat.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-12-ttabi@nvidia.com>
 <DECDZ26UD1EM.1FAMFTZCAVBAF@nvidia.com>
In-Reply-To: <DECDZ26UD1EM.1FAMFTZCAVBAF@nvidia.com>
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 87be57f5-457b-487d-ae9b-08de27727c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWVscFdPTExRQ2s5Q0lWRFJJbTkwdFhtVmtmRFZOaXlvQkdhRE1xOU9FVFVM?=
 =?utf-8?B?ck9xMUtmS1V5WFFBZEJLcmNxSURPRlZ2WndQR1B4ZDFvRUlJVEpZc01ZNGtS?=
 =?utf-8?B?aWJlWERONmk4czFWakNTUGRiTlZITzhpMDMvTnpXZ0puWE5yRy9abEVZd2Y4?=
 =?utf-8?B?T2Jla3RTZHRoK0gzZk9BSUtlYmw3TnRMSUtOVkxJMWFwb0FkQ1NqWERnSHlT?=
 =?utf-8?B?SlZsNU53d2lnaXVkTjAvNXBmOEFDTTY2NG92TnJvRWNXT0ZSQmNyT1hzMHk2?=
 =?utf-8?B?V3lwUjlYa1J5VE5DZEl2dDZpcU5hRFBrM3cvZnpZbTIrM2ZvVzhLdUUyVDda?=
 =?utf-8?B?SEhqN0FicHcxQmg0OW80TVZ6d05mOFcyRzVFdFM4bnBEdHdHSjU0UnBBbStI?=
 =?utf-8?B?b2VKUUY3K0RkcUtxM29zeVNlRlRFUlRucXd6N0h5QldkaXIwMFU5enR6bEll?=
 =?utf-8?B?Um4renhDVTdSK3cyUGc2eHFmblVLVDd2RWR2UEhEM2UreUljYUY5SjIxdGcv?=
 =?utf-8?B?NXlLWW1pTWJjVGFsQjFkTzRuOTRabFd1dkFlQ2V3T1B0c0l3YkVIcGF1bXpo?=
 =?utf-8?B?ZjA0V0Eyd05UbWMvUXk0VEZsaW9LV3R3WVU5YU1ab1RRN3hhdS8rKytpY3VR?=
 =?utf-8?B?d3lDcy9YVDhLNmQ5aENzVXh4VFBxYVhicWlqVEQwOTV1UG5RK1JEQmQzK2xO?=
 =?utf-8?B?UWo4dDMvUzQ0aENLdzF3dWc1b2VRZUdkQ1B6WmF0Yi9rMXBpVXZCYlAxRlJh?=
 =?utf-8?B?c0RRRzVXZ3ZoZUh5VXo0MHJubkJQK3BKMmpBVXU0UmJwaFNpWUdLMTBVMmVV?=
 =?utf-8?B?MVRpMDNtL2dSVk1DUnVxTHdndHVlTFdrbm1Ub25aT0FGMWF3ZEVPOVVpODNz?=
 =?utf-8?B?b3daMUIzcnM4amtQVHhMR1YySkVMcjlkNjhoQzNOLzc5K3NQMjBKZkZjMWZV?=
 =?utf-8?B?dG01RHNsTUhOd2wrYjNwNnFPdEpwakRjazMvMzhvVnI0alNrbGYxNE9ud2Zz?=
 =?utf-8?B?bVBicEhuYXJKUDg3M0FyR21BVHVWRVBMbGVaRHVRR3JSSkJwNzF6VUhmbTJU?=
 =?utf-8?B?UnJlV3VNUFV2RkJ0enlkYVNocUxhVHVzMS9LM1p6L0dGUlZybXljVVJFSXUx?=
 =?utf-8?B?OEIzeDZnaHl3ZDAxSWJtRWRIbEVnQk51bW5GaGZ5TlFTRENyOXdFNExJOVVC?=
 =?utf-8?B?bm9mdER3Q0JMUTRBb0pSTzBmRVNIdXl0M05OaEJldDQyNzB6UUE5ZGZuYWta?=
 =?utf-8?B?K1ZsZDM2VWtQbEovdUQ2Y1hiSHpOMjc0bHVWOUszNEZSTjQxc0NIUFRwUWtF?=
 =?utf-8?B?V2NVV1NEWENQR0xtSWRlWk8xMzFyQmFNYzJuZTdzOTdwc0dEeFlIczBpNy9E?=
 =?utf-8?B?T0Z0bUc2TXhDbko1clc0ekYrdzdMQXlDU0hpUEczVkpiOFM5cDhZTWZ4SmZV?=
 =?utf-8?B?M1F0QmVYNllRcmxZb09PbEp2Z0grUmhkVW5iOW9RZk9weUE3L21oOEhuSTUr?=
 =?utf-8?B?cFF1dDFmTHUwY28vd2JwalI4UERldUt3TFFWWG5EU0pBa0t1Wkk2ZS9JdnpI?=
 =?utf-8?B?eU0rTXBkRnNORXoyUmNiOVVPTVhiYjFEQi9KeWNNNnRCMjJpUWNsTzRQQXBv?=
 =?utf-8?B?cyt3VTFVQk1OdDlVdGh6c0cwWVBCQ25lRFdwSGFXWFBTTDJ2eWZSbFkyRTZL?=
 =?utf-8?B?bTJlUmE2d0VmbmFrYmE2Kzh6Y0ZPL1VuT0RLMFNSbDZrTnhWaWJEbmdDT09W?=
 =?utf-8?B?ZXJtalV2aEdtRTIyREMwTU1VRUE5Uk9VbXdLaTlqeWR4THRmc2l6Q2xHQWxG?=
 =?utf-8?B?cVFkeW5WcVZ4cDVaOUVtVnpkTzlyR3FTTStiaEh5NjZTa2QrOGZVUllKVDdl?=
 =?utf-8?B?dXBITzlSM1ViUEg2NUlDUHpJVmlQdkZmVnE3YWRHem4zdWRIVlpPQk1FN0xO?=
 =?utf-8?Q?yVRoNkBGD8dju4vj9gMtXXU4P6tIku82?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzAxWXJrR0Y4RjRPTWZtZVUyb01DL0hOeEdTdDkwSHN4QVUyUVFIM0dqZitU?=
 =?utf-8?B?MGxma01aNXZmZS80N25IeGtXUnJTNmNCU3o5anNRb2h0bXNNUVh4M2ZrME5I?=
 =?utf-8?B?bHZ4OGgvZWlHdEtGTXo4Zk9sQTlic3NrazFiY25xK0cralRGYk5QSDA0cE9s?=
 =?utf-8?B?OGxDMXVLNEQ0MmRoWHMrT1VhaTN3d3dDVmJLaXRhUEFyejBWM0lGUGlmN3Bk?=
 =?utf-8?B?Rm9ISXozMnFWOVIwRktlR3JoMis5bVFLclIxM1dNV2krR0FSTlVvK2I2WnQz?=
 =?utf-8?B?ajBxLzY4WWJnWmtPc1pQcEQ4bmRDdkt6Y0VSSW4zRWFKZTdSRUdLd21YMitx?=
 =?utf-8?B?bDVsSGR6MWlRWW5MQk8vaEt0Vm5uaVNMRk9iVXczMkpSNDlDY2h0ckVzK0U1?=
 =?utf-8?B?R1NnbU1EZk1OM280akFKZW02RzlyWUczSmgybzBqYUxCSS8xd2owTFgyTkNm?=
 =?utf-8?B?UlZKZXlsL3kxdmhWRUlUUjZ0YkJqSGIzMG9xODZ2ZVJPYmJ5NEpPaUZhL0Y5?=
 =?utf-8?B?Z3ZVZEVCcGt2NlRUeFNsWXdQNVEvanNQYk9MZUZSeG9OL0FkUDA1UzJiWUpq?=
 =?utf-8?B?WE1nYVBTdEZGZnJPdXFoZlo1YWRINnMvU2RQanNhTEhNNFpjWmhQNzI3MGNs?=
 =?utf-8?B?YWRMa2JVSXk3aExMdDBwbkEyczIwUktreTBubXZ4blJoQ3ZpRFJkK0FLbXYv?=
 =?utf-8?B?Q2t2bnNWTG5HTzhtS1B6MnFMZHpKa2NYMUVBNEZNeElpeFlQSjNpSm1MaURD?=
 =?utf-8?B?cG5tYWMvRjA2K1VXQ0VXc0pkWUI1S1ZHTjBVd3ZkM0YreENCMmdZd2czTDBs?=
 =?utf-8?B?NzhVWjQvZ1UyeWV0cWtDZDV4RmhEdnFJVDEzNTlXdnE1MXMwa053TUtwMFFp?=
 =?utf-8?B?NjVLTDg3MkUweG4zMUZJU3dPOFJJTWJOUTlTNnlJRTBEOTVHejBZM2pzdGh1?=
 =?utf-8?B?NGtmQkRNQTkzTElRK0tZa281a0NnM2RVa3JDbTI2NDNxOXUwZFdUd00ydFAy?=
 =?utf-8?B?WmxsTERxdHRpN2VpMlZCUHJRdk0rcmk4QzdQMzBzWGJHclFoVWtWUUR6Z0tJ?=
 =?utf-8?B?T3ZGOXVMK3JocTVFWmtQMGNCSGZOU2dtbHJOaGIxNlhxWGZTcVVNSFRDdnht?=
 =?utf-8?B?SFNzUWIyaXM1VElWZGpTR2V4UWpTNzFuNG5Ldi9ZSERrRnFFMnM0R2FBSjJr?=
 =?utf-8?B?Ym5sZ0RpQjErbjlRVm11UGNDZDQydDJwdXF0Q2ttR0pPODVUK1FpSmNkMUxR?=
 =?utf-8?B?cFRhM0t2b21CekI4ck1yNGs5bDZmbjhQTWNWMGFDbnFZa1Vhd21ZbUtlc2dS?=
 =?utf-8?B?aG02ZVNqRENuZ0ZDeEwvVjdua0ZiL1pTaWxGVk5FQnlKaWc3ZDZhMUhjUkZY?=
 =?utf-8?B?US9rL3prMzZ4SDcvSEN4OEgrTUdJdTNwQ3k5ditIL2ZablJKbTE5cW9NdTZI?=
 =?utf-8?B?eFduWmFSWFRDN1RzRVU2OVFTb0xHNlY5WDZNbGpqRldManRWTFVtbE4yNG5I?=
 =?utf-8?B?YUlEN2gzV1JST2JET3NnTFByYVVQbXhEb0tiRmQrZXE5QVIwUmRIVW0yaXZV?=
 =?utf-8?B?aWw4NFlmdXV4NW13N09meEtnOVVwMWRhVmx3ci8vcEpjODZXK294WU1LT3hk?=
 =?utf-8?B?MHpFdnJtU1Q2U1ZMelA2Y0RQR1o0LzNjQjRhWjQyZGZ4NmYzb2w2N1FDck9S?=
 =?utf-8?B?MDlzdUQyeU9PWnRJSjk0NGIxaDZsak5pV1ZKVFNVU05VcU5sdVBHK3pxMlVl?=
 =?utf-8?B?MWFzQ1ovc2lxWEpPWG5lK01xQ0dRbUpubkRPdEFqTmhKaDZiS24rdCtmSC8x?=
 =?utf-8?B?b3dNbU1ZcVNCRFZ3L2xmUldKMUlZQXVpeHNsQm5NL2hWWFJJK1htRU1kVFY2?=
 =?utf-8?B?Zm9DazFpOUtRZk9JWDhTcFZMdC9icnJOdGZTQUhOS1VNQW12WDhwSzEyaEk3?=
 =?utf-8?B?T1VBWlp4WThJM3pTdDQ2UThBV1VTVCtQWmtETFZ5T20yTTI2VDdITG91OWVz?=
 =?utf-8?B?dGtqNWhhNUE3bHdoTlowMkwzS1Z6VTBUVFQ2bVJaVmFITk4waWJJeDdCQ2lC?=
 =?utf-8?B?NTBvZHRtK2kwbE1LdlA1aVFlak1NMUZ6Y1gwczEwMWlyMmYwZS8rOUpsTXhm?=
 =?utf-8?B?TEhtSEZTQXBPWmNzSzZxcUV4UndEcUhhMVVDSlF0RWw5VFhQUjlPSU9xcHp4?=
 =?utf-8?Q?fJqVZqIa6OYFR5+Vppa1FkRw6N6I1KVdVMtv5t1isB9A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87be57f5-457b-487d-ae9b-08de27727c71
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 13:49:45.9146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFC4QrTjPLCGgXfFJHvgQax48NG+jzWHqqkIGqam6OhWuzZnejSOmtYhrgoGEB5VwErfC40rjIvRQrEjnt40lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571
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

On Wed Nov 19, 2025 at 1:28 PM JST, Alexandre Courbot wrote:
> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>> Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
>> firmware images into Falcon memory.
>>
>> A new firmware called the Generic Bootloader (as opposed to the
>> GSP Bootloader) is used to upload FWSEC.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs         | 181 ++++++++++++++++++++++++
>>  drivers/gpu/nova-core/firmware.rs       |   4 +-
>>  drivers/gpu/nova-core/firmware/fwsec.rs | 112 ++++++++++++++-
>>  drivers/gpu/nova-core/gsp/boot.rs       |  10 +-
>>  4 files changed, 299 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 7af32f65ba5f..f9a4a35b7569 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -20,6 +20,10 @@
>>  use crate::{
>>      dma::DmaObject,
>>      driver::Bar0,
>> +    firmware::fwsec::{
>> +        BootloaderDmemDescV2,
>> +        GenericBootloader, //
>> +    },
>>      gpu::Chipset,
>>      num::{
>>          FromSafeCast,
>> @@ -400,6 +404,183 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>>          Ok(())
>>      }
>> =20
>> +
>> +    /// See nvkm_falcon_pio_wr - takes a byte array instead of a Falcon=
Firmware
>> +    fn pio_wr_bytes(
>> +        &self,
>> +        bar: &Bar0,
>> +        source: *const u8,
>> +        mem_base: u16,
>> +        length: usize,
>
> We will definitely want to combine `source` and `length` into a
> convenient `&[u8]`. Now I understand why you used a pointer here,
> because we need to write an instance of `BootloaderDmemDescV2`, and also
> because we use data from a `CoherentAllocation`.
>
> The first one is easy to fix: `BootloaderDmemDescV2` is just a bunch of
> integers, so you can implement `AsBytes` on it and get a nice slice of
> bytes exactly as we want.
>
>> +        target_mem: FalconMem,
>> +        port: u8,
>> +        tag: u16
>> +    ) -> Result {
>> +        // To avoid unnecessary complication in the write loop, make su=
re the buffer
>> +        // length is aligned.  It always is, which is why an assertion =
is okay.
>> +        assert!((length % 4) =3D=3D 0);
>
> Let's return an error instead of panicking here.
>
>> +
>> +        // From now on, we treat the data as an array of u32
>> +
>> +        let length =3D length / 4;
>> +        let mut remaining_len: usize =3D length;
>> +        let mut img_offset: usize =3D 0;
>> +        let mut tag =3D tag;
>> +
>> +        // Get data as a slice of u32s
>> +        let img =3D unsafe {
>> +            core::slice::from_raw_parts(source as *const u32, length)
>> +        };
>> +
>> +        match target_mem {
>> +            FalconMem::ImemSec | FalconMem::ImemNs =3D> {
>> +                regs::NV_PFALCON_FALCON_IMEMC::default()
>> +                    .set_secure(target_mem =3D=3D FalconMem::ImemSec)
>> +                    .set_aincw(true)
>> +                    .set_offs(mem_base)
>> +                    .write(bar, &E::ID, port as usize);
>> +            },
>> +            FalconMem::Dmem =3D> {
>> +                // gm200_flcn_pio_dmem_wr_init
>
> Probably a stray development-time comment.
>
>> +                regs::NV_PFALCON_FALCON_DMEMC::default()
>> +                    .set_aincw(true)
>> +                    .set_offs(mem_base)
>> +                    .write(bar, &E::ID, port as usize);
>> +            },
>> +        }
>> +
>> +        while remaining_len > 0 {
>> +            let xfer_len =3D core::cmp::min(remaining_len, 256 / 4); //=
 pio->max =3D 256
>> +
>> +            // Perform the PIO write for the next 256 bytes.  Each tag =
represents
>> +            // a 256-byte block in IMEM/DMEM.
>> +            let mut len =3D xfer_len;
>> +
>> +            match target_mem {
>> +                FalconMem::ImemSec | FalconMem::ImemNs =3D> {
>> +                    regs::NV_PFALCON_FALCON_IMEMT::default()
>> +                        .set_tag(tag)
>> +                        .write(bar, &E::ID, port as usize);
>> +
>> +                    while len > 0 {
>> +                        regs::NV_PFALCON_FALCON_IMEMD::default()
>> +                            .set_data(img[img_offset])
>> +                            .write(bar, &E::ID, port as usize);
>> +                        img_offset +=3D 1;
>> +                        len -=3D 1;
>> +                    };
>> +
>> +                    tag +=3D 1;
>> +                },
>> +                FalconMem::Dmem =3D> {
>> +                    // tag is ignored for DMEM
>> +                    while len > 0 {
>> +                        regs::NV_PFALCON_FALCON_DMEMD::default()
>> +                            .set_data(img[img_offset])
>> +                            .write(bar, &E::ID, port as usize);
>> +                        img_offset +=3D 1;
>> +                        len -=3D 1;
>> +                    };
>> +                },
>> +            }
>> +
>> +            remaining_len -=3D xfer_len;
>> +        }
>
> Let's turn this C-style loop into something more Rustey.
>
> We want to divide the input twice: once in 256 bytes block to write the
> Imem tag if needed, and then again in blocks of `u32`. Nova being
> little-endian, we can assume that ordering. This lets us leverage
> `chunks` and `from_bytes`.
>
> I got the following (untested) code, which assumes `source` is the
> `&[u8]` we want to write:
>
>     // Length of an IMEM tag in bytes.
>     const IMEM_TAG_LEN: usize =3D 256;
>
>     for chunk in source.chunks(IMEM_TAG_LEN) {
>         // Convert our chunk of bytes into an array of u32s.
>         //
>         // This can never fail as the sizes match, but propagate the erro=
r
>         // to avoid an `unsafe` statement.
>         let chunk =3D <[u32; IMEM_TAG_LEN / size_of::<u32>()]>::from_byte=
s(chunk)?;

Wait, that will fail on the last chunk unless the input size is a
multiple of 256. But you can replace that last line with

    let chunk =3D chunk.chunks_exact(size_of::<u32>()).map(|word| {
        // This `unwrap` cannot fail because `chunks_exact` guarantees that=
 `word` is the
        // size of a `u32`.
        let word: [u8; 4] =3D word.try_into().unwrap();
        u32::from_le_bytes(word)
    });

and it should be good.

You'll also need to change `for &data in chunk` into `for data in chunk`
in the code that follows.
