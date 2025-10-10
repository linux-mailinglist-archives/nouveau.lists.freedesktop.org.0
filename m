Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16977BCC1F2
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 10:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98E210E3CA;
	Fri, 10 Oct 2025 08:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OFdcYjSa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010044.outbound.protection.outlook.com
 [52.101.193.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D75C10EB78;
 Fri, 10 Oct 2025 08:26:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px2sEu5V8oQgvZE2It8wWPIgDZ4MSA8M/0BhFR9Ws9qnKanjPD6++pZez4hsvxm5DjiiyIDFFX/jASTaUKooFJak4IvyZROaiahcKCES3PUpku2u2bJCJtu29jRFw3SQbsEk2OUEmGFpYRJlMRoaiBbyZAQgKeVCHqSL0UzVQiij8sjBjVleDNHC4GIS14CANRsfWMP1RgIS9sBONBfyRVOxFrKLW8PYII1WjbKs/9Vd0g4QlIXVVWOdtJyyOwcJCkhf+BXqKqbiHcx9FCUcBWHjPHi7Xw19biyiThquhbrrT/POtmbfOuxbf33KyeRbQGIuypjyhOs5coyUwJjhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRNm6/sh0vnjDNv0D+f9UJ///BodRJm5iSP6vz+PEcQ=;
 b=wE7d8r9YpyJ1SiSeOFNiOs5Ocff1VcsmhGcvDdVcvY3jOAsuzmHBJKeXPw75ChDxTCcnqOKaycFMX2ePxYjTjUVN6Vl5YYJJtE8OCIsgHCoum8MciC9mxGHlvoMYSDltH6AT2PhIMEltFvho37IuBTtYjnNzMZjhkjSift7zc5YW9YT6uvVFifwNNShsSCzjg22Zh9nKjk0fX8WqNEwc11EoCjiTC5K/c0g4d7VnRN4wa0DrlxwRBDT29h/ysprqWF7RL1Vtx7IjIBMfOVfKa59CtIOvxur3BRd7BKoT6GAAhaZbI7mNwiyN48sO6tzLqWegefR0HUqWwZxeoKQObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRNm6/sh0vnjDNv0D+f9UJ///BodRJm5iSP6vz+PEcQ=;
 b=OFdcYjSa2WWjZ7D0iSPf4jlddL1QvF2J+6AsWpyvlWLgxv8J9G/dOBnlAOBYhEscSLmjg3OIUoQ+0Y13LDhnU10Ls9d54Q9eixNfTLNAE7MSTfWI0bQVsyWQQa+3UJJpngmrXu1fMSUizV9wNSEPgHkjcvQ2C6qhmz7BRwUkjAOK6ECKbxe23wNH+XjxE7i/jSmnvWhM1i42kMefqtYRa7yb5El/Q0f9YTi1pWs6PP8QzNxva9gIwc9RaOd0ckkdpEUAcLqGCKDkhGP4NKZNakV3rtkjUJ44ADjMIo+2rHCVbioc0hWlkVwhn/2QO6nN8ndszaOB9XjLsCQwmHmaQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB9019.namprd12.prod.outlook.com (2603:10b6:303:23f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 08:26:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 08:26:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 17:26:27 +0900
Message-Id: <DDEHZGZPI2LT.3L27MTHN5QYYZ@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "Edwin
 Peer" <epeer@nvidia.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
 <1ba060e1-a3ca-4570-a641-e1f09026b13b@nvidia.com>
 <D797D35C-C1ED-4AD5-8779-C3F3E0D6BC6E@nvidia.com>
 <DDEHY1VPGOVS.2P6V3S3GFIOR8@nvidia.com>
In-Reply-To: <DDEHY1VPGOVS.2P6V3S3GFIOR8@nvidia.com>
X-ClientProxiedBy: SG2PR06CA0229.apcprd06.prod.outlook.com
 (2603:1096:4:ac::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB9019:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b7d32a-7ade-4bcb-e412-08de07d6b88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFhPRnExVkRxY1BXTlFTTGk2YW1hOXkwWGwyeUJrdEYraXJKZTJES3lzRUl4?=
 =?utf-8?B?dW9PcUlTRzhYVXd4Nmx6VW5HSWQ3N1hOck1SOWFPRUlGeGVmajNJWjhKUkoz?=
 =?utf-8?B?bmUvdU9NRWJiV2xuUVpWeGdpT08wUUhjTG9DL2ZkUmJMUGdBbjM5UWxiOGEr?=
 =?utf-8?B?TWdpTWorRGpGbE0rRVYzMVVCN1FHOVd6QWxOTERHSWE0emxVRWVzZCtyL1ZL?=
 =?utf-8?B?TDBFY2dCcTVtcmZ6TWpFWDd6VEpnVTNreDV4QlhIMVhoc2Y0WFowNjdYOHIx?=
 =?utf-8?B?aXI5bmZxNVF2ckhxQTRiQ3Urdi8zbExqa3E5dCtzUEhWSWY5ZkcyZ3FzdGlh?=
 =?utf-8?B?WmR3YTVGZG9sMmxsbXpBNHB4K1YrNVpWUFYxRllXdnhXeHljUE5UcjZLNG1N?=
 =?utf-8?B?aUFCWkY3TExoeHphVmx5NmswVUpjVlZuMEVrMVYrNDV5VzErcFI1dEwwSFFv?=
 =?utf-8?B?eHBmQmczaUk2a0h3RkU2WUVpR3NuNXQ5dHpseFkwbDIvK1UzQXMzR1NSZnJH?=
 =?utf-8?B?VTVuYWs2TXJlQkMrakxyM1l5NE1pVjRsNjltVy9OR0plbEpsWGUzcWx0bDRW?=
 =?utf-8?B?V0JUTm14OUw0dUtBMWdYaTlhYVI1OFhQVERndSs3b3cyaE9GR1dpeFhsSTV5?=
 =?utf-8?B?S2pvUmlwQ3h3cVZWcEI2c2hucmc2RUNNa2w3MWwzUTBJQk1wNTRSWFZEcmRF?=
 =?utf-8?B?ZTIyR29qTTVkK20vYlNOQnhicnVtZ3JvV1BNWkJodEJsMlBDSjFhT0Jqa0tv?=
 =?utf-8?B?dDBjMHNFWWVIYWg1ZFdQWDY2NFJTdk9DNm1sQ09URHhiVkxxOXIvb0hTM1px?=
 =?utf-8?B?aTRWaWxkajl6c01zVyt3UzZLc1R2bElka3I3UjNtbWx0T1lpNnFzS2gwN3VV?=
 =?utf-8?B?SUhyVG40VUlyUEQxc3MwQW1wUmtTUmpDclM4TzBFZUs2bk9IZ3dlQ251UW9m?=
 =?utf-8?B?WktsSHVBeFVCdzlsTUJkSU8vMFVYbXlUK09pWFR1bUJyVlk3Zk1vakdVa0xH?=
 =?utf-8?B?SUY0eStnbTJsNlJ4MmYwUmRRZVhZTEh1cU1LMy8zV0h1VER3QkFFajBGRWdW?=
 =?utf-8?B?RDhVMmZYSWdHLzhsS21VOTVrcVRmOFU5UlFDeEtPU3V6UUVPcjIvN2hCZGp3?=
 =?utf-8?B?TlNYMnR1QzE2dTIzSDVncUh5Q29RbHpxNy93WUtMSjZSV2NCdFJTMG9kR3ha?=
 =?utf-8?B?Q1phazVRQjRMeE5ZUjFURkpHQ2NRVnIxdFYwVVJTeXJ1RHhJcjk0Q09zVUJG?=
 =?utf-8?B?NkJ6cEs4d1lSVTE5d1VpU21yQnNEOU84RkEycDI5ekFycEhXN09MQ3JCNlVw?=
 =?utf-8?B?QkprV3YwSjlWNllzdEZ3Z1g5djJENGdQTHhkTS9ieTZUSGl1bElTdVE1K0Rr?=
 =?utf-8?B?c1A5NjBrNU9LUkgrbWk0ZXRlSHZTbjhsQlJjdDJIZTFJSlZieUc0WEwxWGNi?=
 =?utf-8?B?R2RzTllPeGErcXhhMkFpNkRZWmpnQVhHb3g0bFUyOUxpc1h2RkVEMG8rdVFW?=
 =?utf-8?B?TEw1UVREYThJYU1VQ05aZ0toUzFvZHUyZ2hobERveGpQdEw3Q2x1T0tjRWlW?=
 =?utf-8?B?QmlQdjJNOFN2SlJ4c0F5RnFLdVRMekpaNDhTcW5VTjdGUGZxUUlySDltQWNy?=
 =?utf-8?B?dkRFcUp0MVhBWS9yMG5CaGsxVnl3RnZrd3RyaWluMGhubjNNUndSTW8yZERP?=
 =?utf-8?B?OTNDV3NFOUEvVlM2cVNTenNKQU5NQkpxcFJuWXZZRk5xVHhFU2xNcy8xVWts?=
 =?utf-8?B?V1B3a1NuTnV1bXZYeFdIQnVINlhXdDM3ZXBzVmIzQVJKMlkzUXNyZTVOdDc0?=
 =?utf-8?B?a3FvU3RkM3pGVUV2WGJVMFM3VzZ0MlkzRWJDeHNJUkVuaU5vVlVHMCtMQ3Ra?=
 =?utf-8?B?dlgwdm11RkZ5aXJzY3IycE41Nm1HS3BJdnkrWlZaVEZjbzVtWHNGK2F3b2Zs?=
 =?utf-8?B?SFBwbUp3WlU3NkZ5MXZlbjlPcmFSZDNKTFJSdjBmS2JxN2VvVmVoRGFhZjkz?=
 =?utf-8?B?bnBTcEpVZXU1R1lTT3hkLzVSOE1IYit3Smd2aVVvb0Q0RjlYWWhDNENha0pn?=
 =?utf-8?Q?D0yMBW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WSt2MnZaSWNmbmlSYnBkc1lsdm9qVjcxL2dFaHM1c3E3dkxVdXpaUGoyY3Jz?=
 =?utf-8?B?Vnk0LzYrMUowNVhmbXppVDlpL3NtQ2FEUlFVdjdpb1ZUMzN4MHlkd1UwbWVG?=
 =?utf-8?B?MFI5K1JaN1IwMlBrYkVBYXRlcEFsZS9uWFNWT25xaHg4OUxhYWtEZkw2ZDJp?=
 =?utf-8?B?SVVObHZxcXEwREpZVXE4eDN1eEVudlJFOUFsUXNHVER3YWozU0Vka0FiMXlu?=
 =?utf-8?B?N1JkL3B4aUQrZ054UFJxY0ZzNE8vRnhHeFp5RUM4dFRVbVNJVU4wU0tiZUY3?=
 =?utf-8?B?Q0JoVHZOUUxXYkVJTHlyd1VBekg4ZnhGZVh6dzd5c084WVd5NTVobHhQMWtY?=
 =?utf-8?B?NkFnM2p3ZGU0c2l2L0haMklRc29OM00zVDBUV3ZRZi9vd0szZkF3ZERFclBw?=
 =?utf-8?B?U3haM1ZRb1FRSk1BQW5tajNwbGl2cS80UXFzODZZMGl5NTJzMkRNcWxTSVAv?=
 =?utf-8?B?UVN6djFTMTA4Vys4aVRoNDBnNWg3Wkp5dGNjRVZ2VjdRanZ3Tm1zQ1daSm5p?=
 =?utf-8?B?SjJTTHhxM2xJU0xCb0dYT1A2eEVqQ3cxbEVjZE9QVENlcnhBUnpyaXRseVRv?=
 =?utf-8?B?VDVJQUo2SWlNQndzc3k0cEIrc3FuZE11NGpDMStqVk9KOEdlb3FkZnNwbEhD?=
 =?utf-8?B?azNrTGdiaElJbzUxOXV4Q0NhU2lxWlR0b1NyNldmbVlyWVV0UkhCMGdGODF5?=
 =?utf-8?B?Tlh6RDJaSmNNcFIrQ2hCY09oV3hNcHFUdzRPSlJBdGYwUE9CcnJKanROaTNz?=
 =?utf-8?B?YWYrV2h6b1BJNUgwMDNTT0pQM21ZUUFtakVjeEl4cWsyNUFjV09jSkI5c3Bn?=
 =?utf-8?B?cm1QTi9HdldOdm9kaWhpOXVjQ09pUEUxN2xCK3ZRZGI0b3ZJc2ZUeG1DZTRT?=
 =?utf-8?B?bno2ZkVVTGtxZjdTTWRpa25xaTFob3VVdGNjM21Sc0s1SDRNZ2RYMlJlZUFQ?=
 =?utf-8?B?NGRvYS9XeXdwSndCTVllVVV0L0xKZkhoQVI1clRXSmVUbHg2TURUN1p2QUYw?=
 =?utf-8?B?VjF6d3FDcjlnUjEwRWs2ejBiUG10UXNIQmRlc2pZU1h1V3lJRVhtS3d3Q0F0?=
 =?utf-8?B?M2ZmY1kwSEd3MUZBajM4ay9UNERkcVlXYXMySXZndTZkVGlobk5jSGIyYjM3?=
 =?utf-8?B?WkZHbTZTWTU0WVgvMDAzbWUzeVl6dnphL1dlQ2drc212UzJXNTNmT00wKzVJ?=
 =?utf-8?B?YVZJaDd0R1ppa1dQcjMvdGdTdlN6dGtkdlErZlMwSVgzWDNHT1VRRmZSY3pL?=
 =?utf-8?B?bFViMENualJCdXJaTHRETEFKbURFU0JzUkduRmZGV2phcTlTWWRuQzBnUlF4?=
 =?utf-8?B?aUZKc0RrcTd6MUpRdzRZSHRSZ0lYZmZrbFVYUEdtZzVVK2pHYVM1clpUbHNz?=
 =?utf-8?B?dXhLUjVyUHRzWEkwWkVUMHFhMkwvOG9SVHEwcEZBb3ByVUZWYTE2WEUvVlJa?=
 =?utf-8?B?V3BtZFBWdnE0U2FweER3czRNVWJHY0JpZEZBdjQxUFhaeG5kdE1Oajl5N3lD?=
 =?utf-8?B?d3VXZTkrVWRBODM2MWEwUXdFR0diUThmVzVMbXRvSTBiYUF0L29zWGxUckFK?=
 =?utf-8?B?NFVPWjk5UXRZdjVDNEF4dC9PY1dseDRnWVZxUWxUMUx3U1lIdk01dDNBN2FT?=
 =?utf-8?B?bnE1aUNlQXNCMXNRRHFHMndHU1J5dVN2UWJ5NTB4cVVEa3U3RkRGT00xaHZs?=
 =?utf-8?B?MHJMTDViYWFOTmk0eE5zRzRkMnNTbmZpMnNPUUdpeHorR05HSXBiaGw1eFBZ?=
 =?utf-8?B?N2MxSVNvVmdvTU12S0tWREN6cHlrZlN2bmljSlhFWHU1Q2M4UnF0T0dzalU1?=
 =?utf-8?B?ZFBCNXNLN2JrZlFBM3Jaang1ZW9Qc0NrRFBNcWpMbndvb0VkeHlzYW1DdnFO?=
 =?utf-8?B?d0FYc2p0Rk5HSEFjemFyWE9CejN4dHhIZG1IKzF4SXdzR1N2WVllL3B4Qkdw?=
 =?utf-8?B?ZW1XanlYYVNORmJ6ejM2NkpYQkpDa3I2enBkME9zb08wNThhSENOQmpEVy9n?=
 =?utf-8?B?cC84WDN6dWZsV1VKVnZsY1Bwekd1U0d5UTFLUUZQZHJkb3VKN0FKbTZTUExy?=
 =?utf-8?B?bVhPL2RzdmJWLytNQm1KNzlzTWxPR05KUHAvZG90czRNNk16UzJwYmRtaGVJ?=
 =?utf-8?Q?k24I2t43jfiOfL8S4LzUCWu/d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b7d32a-7ade-4bcb-e412-08de07d6b88a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:26:33.6899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Skj45d/4wM33pILpUz2bC2EyZh1kMblo5HX4FvziV5Un6ZDxkoJJ05pHhPJgxMaD9YmTvh4U9vtWjXZ1nbc6EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9019
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

On Fri Oct 10, 2025 at 5:24 PM JST, Alexandre Courbot wrote:
> On Fri Oct 10, 2025 at 12:41 AM JST, Joel Fernandes wrote:
>>
>>
>>> On Oct 9, 2025, at 11:17=E2=80=AFAM, Joel Fernandes <joelagnelf@nvidia.=
com> wrote:
>>>=20
>>> =EF=BB=BFHi Alex,
>>>=20
>>>> On 10/9/2025 8:37 AM, Alexandre Courbot wrote:
>>>> The getter method of a field works with the field type, but its setter
>>>> expects the type of the register. This leads to an asymmetry in the
>>>> From/Into implementations required for a field with a dedicated type.
>>>> For instance, a field declared as
>>>>=20
>>>>    pub struct ControlReg(u32) {
>>>>        3:0 mode as u8 ?=3D> Mode;
>>>>        ...
>>>>    }
>>>>=20
>>>> currently requires the following implementations:
>>>>=20
>>>>    impl TryFrom<u8> for Mode {
>>>>      ...
>>>>    }
>>>>=20
>>>>    impl From<Mode> for u32 {
>>>>      ...
>>>>    }
>>>>=20
>>>> Change this so the `From<Mode>` now needs to be implemented for `u8`,
>>>> i.e. the primitive type of the field. This is more consistent, and wil=
l
>>>> become a requirement once we start using the TryFrom/Into derive macro=
s
>>>> to implement these automatically.
>>>>=20
>>>> Reported-by: Edwin Peer <epeer@nvidia.com>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>=20
>>> As these are incremental improvements, could you please rebase on top o=
f the v6
>>> bitfield series so it does not conflict?
>>>=20
>>> https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=
=3Dnova.dev.bitfield.submitted.v6
>>
>> On second thought, I could just carry this patch on top of my v6 series =
and avoid too much conflict.
>>
>> So if it is ok with you, please only carry the last 2 patches of this se=
ries whenever applying.
>>
>> For this patch:
>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> I will review the other two patches as well. Thanks.
>
> The idea is for this patch to go *before* your series, to avoid the
> asymmetry in the From/Into implementions of bitfields. We could also put
> it after, but it would become larger as a result and I think it can be
> merge soon after -rc1 is tagged anyway.

I forgot to mention that this patch is not really part of the series ;
it's just here to allow it to apply on top of drm-rust-next should
anyone want to try it.
