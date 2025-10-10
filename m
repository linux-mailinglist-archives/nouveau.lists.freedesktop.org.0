Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AEDBCC4E5
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 11:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149A510EB8F;
	Fri, 10 Oct 2025 09:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nKEmqtF7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A374010EB93
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 09:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+PuWGxtqUjA96+9/R76p0qHZxeV70u4kDLsAMp+Vmg/pvk/dgZ05Sv9ko+C0yM3n1mjpE6DvqiRvmHN4R2EWiynRTiVZnFO/eAIV3fQCoyqthY87ILx42FVHO3T4lfcjavskAKMkDU6BFBv8E8FIu6aavUbXP2KojHrXVBVvmOYi7vZt5mdF2t7LQVt+dBuAwXHS6uRdkJnOeGO7KnfYZBTHkGoe2My7t7jeadP1pbRInsPNkZNN+8q9oofkw40+YwjG/yiK+ref+a3HqETAqk5lawvf1p/RsCfUrm7gEcal5V7LC1w0GFo30bUg2Omr0Pul2+qzm8QKmFe4oPTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWOy46no9WAq3fEBY3nApwsAawKNIaG0aoJeBVsJFTk=;
 b=BHlgKdadfXOolbvrum2XPSThyCb0LqsA9qw2Io8k5fw/DsQKqG25VyfuVetIHqyh3K4lVnpqeFtMu8ePjOttMcZpDq9+23rUtEBWvGock+761DZ9NBzXoCtUUHdvsgjUmeu++3b4BydYVTwSuAWrXfqVlUMyhoNLnzO3XFs3jTQYooHvuQ/relg/x9Q9XP1vWBqlkSWXUa2xKH9aC8czxk6KhWsJ/xOG9DzXjA5o74MedV4Dx2cEUXdyfLSC99V9pNUw3eSKZ2vKDIKjTFIWZNY5MMx+ZCcpsRbvXxFagHd5eUr46UszVZYUQyISGjuzUunABmAl9F3a/T02/TXRyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWOy46no9WAq3fEBY3nApwsAawKNIaG0aoJeBVsJFTk=;
 b=nKEmqtF7IQRiHIN/QEgjTaU6yL8ADLINWzQtr/Nnnjlo+EFtUuiq5cZQZEEA/Jjt75Rq9ed3zKTNFkU9sNxv4RWtGwTmTMtga5YVgSufpGcofS6jOygcacSqAh9CbGnjLbkNDrz5h4uUOguTsTHiJBUghS/w1BEth7qhQ91+ZG99KPHs/cIDL9YM7wCtqDHDHNFXC/ZO3pdYqcgpjMXo24hvR3AcK3gB3xZiam0yKvtemNS+EdffVjfrYg0I4DhEzKD+EU6R1Opbs2wVI/PuzJrcxd3Z4ZwHEjbcSSj4QRMngLw1fbhQSgf4CahpDo7UstbbcmlpKHGlRJrxLFwsjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPF28614436A.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Fri, 10 Oct
 2025 09:19:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:19:22 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 18:19:17 +0900
Message-Id: <DDEJ3X0C2RNH.13YEXJI3CTSPF@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feong@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <yury.norov@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
 <aOflmmHe8O6Nx9Hp@yury>
In-Reply-To: <aOflmmHe8O6Nx9Hp@yury>
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPF28614436A:EE_
X-MS-Office365-Filtering-Correlation-Id: e752c292-a535-4da2-8f85-08de07de195c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1pBYm5KM3VMQW43NEVJTUVoMld2TjdBS1g5YVp6djlqenN3aC9yYm90R0R5?=
 =?utf-8?B?dW9tNFBwTEE3ZUdyenBJczhLOERhL2tWVldLMk00dDVmVVVBZXM0U2FabXB4?=
 =?utf-8?B?R0lUTno5VmxHUW5DTGhLdlhRemJCRTVwSkN3Sno4VDA3T3dBZmpRQkhxU3J6?=
 =?utf-8?B?eDBGSjlKUngwQ0UyYytzdGhBSXdrcFltVWVmUm1MWlR3K3VIdnVyandwd2xI?=
 =?utf-8?B?OU9CekdoeXZHRldSR0gwMHlwSGRHTjNWSFVuZFFtMENsQ25xM2o3a1ZaQTY1?=
 =?utf-8?B?OWhWdUpOczArSG1tR3lMZEw1RE9pVUZ2RDh0aDM2Rm1oaTlzcjZxbHh6U2hB?=
 =?utf-8?B?NW5zU0NXRC9YalhUcW5xYTIzSThUeVBwSFJ4aGtvV05IV3h2R2pmVWxrR0Vv?=
 =?utf-8?B?eVNtd3FhTW9PWkNLbE5CcDhLOFRINzdTYk5zdG00SkRxL1lZbVhpSnJ3c25y?=
 =?utf-8?B?enpmM3FrUnZKaGxBYVpjckdDRU5hYzhoek9qY2t1ZDlXcEFmbU45S3FnTFQw?=
 =?utf-8?B?bmJNUGYyZ1VBbVlwWUFERmk0OFZqaXE3azRSMlhKSDVzUzFmVENLY2UwK0ZL?=
 =?utf-8?B?S1ZXOGliM1E3UmtPSk93VE9UU1JqT3JiQ0FEOU9lMjJsNmZNOGQ4WkVsQ1k1?=
 =?utf-8?B?SEhQdFV2aEhVREYydFRjYzloQzZZZHNqRUR6cW5BcnlaTjJqSE1SU01lcjQr?=
 =?utf-8?B?SUZuWnorc1JPYzRhS2N5WmZmcHcwWEFqQTdPN3p2N0p0QXFFREVyNFpPMU9J?=
 =?utf-8?B?WW5nYXNmcjVCcXhZVEI2WWhhRWdEcTlKM29zbnZNN2FXeVM3SWsxK2JnaC9l?=
 =?utf-8?B?WFkreC93azRpa2dEOFk4enJFUVd3azFmWW5YcnRYdHhlcjlvUkZRM25YZ3kv?=
 =?utf-8?B?RVZLWUcrcUNPQXhOendSVldsdmpCbWJsaXM5WitVdHg0b1RNZDBsYXBaWUtB?=
 =?utf-8?B?aXUweS85VGZIelYwVUlSQ0E0djBNVGJoLzR4TTVaclV1YlhZYWphbkdCclpq?=
 =?utf-8?B?Tzhpb0FncVZrc3J2S3p0OGxncHRBZEpzQ09Zbm9LaUR5N05VTjBtazRFR0E3?=
 =?utf-8?B?MkdaV09uWlpVQzFteXFnUER3SHhEQ1JIWlNVdkxaM1JvbHZ6RUROS3RUUzN1?=
 =?utf-8?B?dkxxRjEwdU9mZlI5ZlFMandzRTBhVUhPMTUxczJBZzJYTjZtQzlRVmRmRWFB?=
 =?utf-8?B?L0cwUmduU014MXZNUXNvdVdIZjUxVTNqZDVxTXFZd2JvVUdVWWhFK0RaaXZY?=
 =?utf-8?B?bHN4RVNuTk02RHdsTjJtZUVKbXpLYkxqcnV0UWtianlJZkhiTHFWMWNPcXJt?=
 =?utf-8?B?Y08rOE16SDJ0ZTdhRUVMMEdiYkg2OTN0eTA4L1JLUU1HMnFjK2tzQlNacHZh?=
 =?utf-8?B?YWVnUEJkazFaOFZYblRhdzU5OTRLMFVKNkZoK1lyamVpZ1ExSFp1b3JydDhR?=
 =?utf-8?B?VmNWcE5NbWNXRlBQcXNXOWVkampUWlhLV3l6YklNbWZleC9ISDBTY2t6TEVy?=
 =?utf-8?B?Yk5ycHU5RnNEWmx4UzVWZkFLYXQ1eG54T1F6Z1k1dHpWSVFSZ3FNa2NOaDR4?=
 =?utf-8?B?K0J2dk9uUHoxYlJiSUFDMHIzQlJyQmhjY0JsZkc3REJDcEJqdGlqanZocWcw?=
 =?utf-8?B?dnl1L0ZmN0VvZTROdnJlNXEwUlArTytVNjg4aU5Qck5Fcm5HdFE0YVZNZ044?=
 =?utf-8?B?ZXZQWTJWZTZjSjRkTDM5elFtWGNtQlVrQUJibGdKZnNpZmdYMDF3ZzNSY0pM?=
 =?utf-8?B?R1hnWE43ejBPUkhoc2xGaEFFNm5MaFVmSHlvcWJtOTE2K3NWWWR4RlRPUE5h?=
 =?utf-8?B?Z0U0dzF3dVVxUkZIY3hhZXYwbEhSWWRodkFyZEMzRDlzTHIzTUVOZGZOaXU3?=
 =?utf-8?B?Q3RUZGE0RERyckpEdXBodUVWNFN0VjZ2U3VoRm9nNDZxaVdVMXh3aHhEK29l?=
 =?utf-8?B?STFMYXRqS3Z2MDBKZzlEdFdmczRRalMxWTdKRnozV0xLMjJRRG5VZTFmay80?=
 =?utf-8?B?VFdEVGpKZXB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1E0WkcrMEo4cXFWMzJTQ2RLSU9FUHN0TVVad3RNQWF5UisxQ3U3U3R6Tk1o?=
 =?utf-8?B?WW1qanQ0ZXI0OTU1NFdSU0c0S0NGUU44eGVpaDVKZ0VSaTNLcVdiOGlURW5V?=
 =?utf-8?B?ZTdCUERpRnpva0hqS3JGSDZYZG55MUI3bytTSXBQdXQvalYyZ0Q5eU9xa2Nn?=
 =?utf-8?B?TEJQWjZDTERhank1aHBqdmVFWXJJV0ppL2w0VDlkamk0QU5rekFLaDdDV0h4?=
 =?utf-8?B?d3RMZk1GMGt1MUdiQWVmMFpXWnZ4RmZoVGlja1pOQWRMczdjSXpLOS9Xd1Y4?=
 =?utf-8?B?VnZ6KzI0Y2RVZUVsMmdISEZxZ3N1dnhhVjJDMDlndnIwWVNSZkhaYS9FTjBi?=
 =?utf-8?B?UUxLSkVMR24yRm1GZDlvYUlIL3hSNHY0b2VSTjlhUmhaMTlHUE1WRzF6ejh1?=
 =?utf-8?B?OEdKeU04WW9wQjZteVVnblYzRXI1Z1VkVjRyZ00rZEJoRGFoUThGUHp0NkpT?=
 =?utf-8?B?cVRDL0JRRnRDTmdCalp5Mk5hb3VRaktabHVHakNxTXZqcWhJbXVSMVZqRmF4?=
 =?utf-8?B?eHJTMm9IcVlwN0h2NmRuOVZ4TzJwaFJyMkRJcktOU0RKeDVRUWJUdEV1emtW?=
 =?utf-8?B?M201ZWRCWmJXbHpjSXRRQlNZZUtrK2VEdFFYbVJ5eEZCeUltUGpLbU93aWRT?=
 =?utf-8?B?VFNHL1FHanAxZmFBRGpVcFFOR1RIQU5lTnd6RTlVeVY4OGVPUXpVdWZPVFNm?=
 =?utf-8?B?WDBEbWttNEVjMkVDMU1pblloUUMzUTIxdlZFWlRQV0VuVEFGSFBFWTFweUh6?=
 =?utf-8?B?WFFZamR3TStTMmFjbEUxbFo2ekpIZ3hmRE90NVl1bUphNTBqY0F0RkdCRm01?=
 =?utf-8?B?SFNUM1BYSXhySUlPcWNuL09TRkdQaURya0g1QXpTUUxBdlhHaS9jRWlqanVS?=
 =?utf-8?B?RlZvWWwzWkhuZVd4Q1lUdmlyd2Y5UnlkZ29RL2FkcXN5ZjZITHBVUUg3ZjFr?=
 =?utf-8?B?bFBNaHlpM29IMU5sY1pkbW13L0R1UEs0RFlWbXMreXprUUpTWC9BWEk5R2U1?=
 =?utf-8?B?ZzBETFJwQ1dvS0NidTEydGg4VkhTRDlwSlZJWk5qRU05WDFGUkpOQUIrempG?=
 =?utf-8?B?Wm9USmJPTVlMd3VMZDZtc3FPcDFXUEc2N3hRYUN6VFQvYkdsNVN1K01lV0Nl?=
 =?utf-8?B?YjJFbGdxR2pwaXorMS81ZmF1aGJrQ2RCRkNuY0pKa2hvZ1laQ0tYYTZQbWZV?=
 =?utf-8?B?cDZTSFY1dnpGdVpNZ1F1ODNZUWVWOXlkSlNCMUtMaEV3TkJjVDV2N1NsWjVC?=
 =?utf-8?B?NVJ4NExSdnNXWlF1U3g5RWlXdysxOTVBbGVjSVZJSnN3R2o0dnVJZmtINlcx?=
 =?utf-8?B?U3RGZW5DY2NneXJzWk5yQzRWcW9LdlpNUHVrejlhZStTS0wxOWY5ZFcxMDlR?=
 =?utf-8?B?Y0hURzIxVjNDUGtYRDJuS3J1SHpGUnM4Q1VYYXgwd2ZGYVV4TUgya25GYXoy?=
 =?utf-8?B?dVBIaWFLT0xlUi9La3NESW1JMWV6MS9HVzl4bmtNVWtLb2R2U1ZrSC9kVDdR?=
 =?utf-8?B?bmV0ck4rQWY3SFFzVXVLUHE3ZUVMV0pIbERTczg4c20zbzNHSER2OURGV0di?=
 =?utf-8?B?czRkTEw2Q2VNN0VTQ3lnS3ZERzN3cDg2ZHJJN3Ntc2VNSUZsU2VBRDRmMXk0?=
 =?utf-8?B?L2NNTXBIMFRwcXFDaVZHa00yN2pWU3ZrRUw0SGpZb3BEMW5jUm9wRFZEYS9W?=
 =?utf-8?B?c2pPWGk0NXVHdjlRQ0pCWHBHUXgwcGVUczRCYUN6MWw0TWgwaFNTL0NvN1NJ?=
 =?utf-8?B?cnRYMUZZQXJibVd2NW5nQTZaQm9uRXV3ckUxTERzYnVwaWM1L3VYTHhCUC9n?=
 =?utf-8?B?OHNCTHdVZ3dJRzgzVGdFV3FUbldkWVl2cDZSUFB0S2lsSmpJeGNPdUZPN2tE?=
 =?utf-8?B?R1YvK0lxRXVJYzZjY0NuU09ybXZkY2NQNWFRVjFvUkxVa0UrQ1VkWkNVNWpq?=
 =?utf-8?B?MzBDaGZWM1pJcVZnQ0thZW5LWjNCMDcyTTQ2T3ZiS1RobzdDRGdMM3pjMGNj?=
 =?utf-8?B?MG5QZ0NscjZDaElvMU82aXdyMVphNVZ0WFdPMnpIbkdTWkFGaVJtVllTT2VF?=
 =?utf-8?B?bTRqZURlN1NoancydEZ4Y2JLQVMyWEgyNWpCaG9GMEJhcE80NjFkZS93bmtv?=
 =?utf-8?Q?jfCjgUHLiedNQGeaU9EjYO/gh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e752c292-a535-4da2-8f85-08de07de195c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:19:22.6652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPC5pCT3JCBjIx9dCTFU/vpza4m4gDi8ZF8FUAua47lkJ6mmVnd3k+KRgIK4W57FGpevGWFMA0XIBOAgxZOaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF28614436A
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

On Fri Oct 10, 2025 at 1:40 AM JST, Yury Norov wrote:
> Hi Alexandre,
>
> On Thu, Oct 09, 2025 at 09:37:10PM +0900, Alexandre Courbot wrote:
>> Use BoundedInt with the register!() macro and adapt the nova-core code
>> accordingly. This makes it impossible to trim values when setting a
>> register field, because either the value of the field has been inferred
>> at compile-time to fit within the bounds of the field, or the user has
>> been forced to check at runtime that it does indeed fit.
>
> In C23 we've got _BitInt(), which works like:
>
>         unsigned _BitInt(2) a =3D 5; // compile-time error
>
> Can you consider a similar name and syntax in rust?

I like the shorter `BitInt`! For the syntax, we will have to conform to
what is idiomatic Rust. And I don't think we can make something similar
to `=3D 5` work here - that would require overloading the `=3D` operator,
which cannot be done AFAICT. A constructor is a requirement.

>
>> The use of BoundedInt actually simplifies register fields definitions,
>> as they don't need an intermediate storage type (the "as ..." part of
>> fields definitions). Instead, the internal storage type for each field
>> is now the bounded integer of its width in bits, which can optionally be
>> converted to another type that implements `From`` or `TryFrom`` for that
>> bounded integer type.
>>=20
>> This means that something like
>>=20
>>   register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
>>       3:3     status_valid as bool,
>>       31:8    addr as u32,
>>   });
>>=20
>> Now becomes
>>=20
>>   register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
>>       3:3     status_valid =3D> bool,
>>       31:8    addr,
>>   });
>
> That looks nicer, really. But now that you don't make user to provide
> a representation type, how would one distinguish signed and unsigned
> fields? Assuming that BoundedInt is intended to become a generic type,
> people may want to use it as a storage for counters and other
> non-bitfield type of things. Maybe:
>
>    register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
>        s 3:0     cnt,
>          7:4     flags, // implies unsigned - ?
>        u 31:8    addr,
>    });

The expectation would be to use the `=3D>` syntax to convert the field to
a signed type (similarly to how `status_valid` is turned into a `bool`
in my example).

> =20
>> (here `status_valid` is infallibly converted to a bool for convenience
>> and to remain compatible with the previous semantics)
>>=20
>> The field setter/getters are also simplified. If a field has no target
>> type, then its setter expects any type that implements `Into` to the
>> field's bounded integer type. Due to the many `From` implementations for
>> primitive types, this means that most calls can be left unchanged. If
>> the caller passes a value that is potentially larger than the field's
>> capacity, it must use the `try_` variant of the setter, which returns an
>> error if the value cannot be converted at runtime.
>>=20
>> For fields that use `=3D>` to convert to another type, both setter and
>> getter are always infallible.
>>=20
>> For fields that use `?=3D>` to fallibly convert to another type, only th=
e
>> getter needs to be fallible as the setter always provide valid values by
>> design.
>
> Can you share a couple examples? Not sure I understand this part,
> especially how setters may not be fallible, and getters may fail.

Imagine you have this enum:

  enum GpioState {
    Low =3D 0,
    High =3D 1,
    Floating =3D 2,
  }

and this field:

  2:0 gpio_state ?=3D> GpioState,

When you set it, you must pass an instance of `GpioState` as argument,
which means that the value will always be valid. However, when you try
to access the field, you have no guarantee at all that the value of the
field won't be `3` - the IO space might be inaccessible, or the register
value be forged arbitrarily. Thus the getter needs to return a
`Result<GpioState>`.

> =20
>> Outside of the register macro, the biggest changes occur in `falcon.rs`,
>> which defines many enums for fields - their conversion implementations
>> need to be changed from the original primitive type of the field to the
>> new corresponding bounded int type. Hopefully the TryFrom/Into derive
>> macros [1] can take care of implementing these, but it will need to be
>> adapted to support bounded integers... :/
>>=20
>> But overall, I am rather happy at how simple it was to convert the whole
>> of nova-core to this.
>>=20
>> Note: This RFC uses nova-core's register!() macro for practical
>> purposes, but the hope is to move this patch on top of the bitfield
>> macro after it is split out [2].
>>=20
>> [1] https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n=
@gmail.com/
>> [2] https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joel=
agnelf@nvidia.com/
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>
> ...
>
>>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>> -            .set_base((dma_start >> 40) as u16)
>> +            .try_set_base(dma_start >> 40)?
>>              .write(bar, &E::ID);
>
> Does it mean that something like the following syntax is possible?
>
>         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>             .try_set_base1(base1 >> 40)?        // fail here
>             .try_set_base2(base2 >> 40)?        // skip
>             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };
>
> This is my main concern: Rust is advertised a as runtime-safe language
> (at lease safer than C), but current design isn't safe against one of
> the most common errors: type overflow.

Not sure I understand what you mean, but if you are talking about fields
overflow, this cannot happen with the current design. The non-fallible
setter can only be invoked if the compiler can prove that the argument
does fit withing the field. Otherwise, one has to use the fallible
setter (as this chunk does, because `dma_start >> 40` can still spill
over the capacity of `base`), which performs a runtime check and returns
`EOVERFLOW` if the value didn't fit.

>
> If your syntax above allows to handle errors in .try_set() path this way
> or another, I think the rest is manageable.=20
>
> As a side note: it's a huge pain in C to grep for functions that
> defined by using a macro. Here you do a similar thing. One can't
> easily grep the 'try_set_base' implementation, and would have to
> make a not so pleasant detour to the low-level internals. Maybe
> switch it to:
>        =20
>         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>             .try_set(base, dma_start >> 40)?
>             .write(bar, &E::ID);

`base` here is passed by value, what type would it be? I don't think it
is easily doable without jumping through many hoops.

Using LSP with Rust actually makes it very easy to jump to either the
definition of the register, or of the `try_set` block in the macro -=20
I've done this many times. LSP is pretty much a requirement to code
efficiently in Rust, so I think it is reasonable to rely on it here.
