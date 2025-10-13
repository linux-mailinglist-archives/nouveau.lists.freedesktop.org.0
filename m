Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2855BBD34F3
	for <lists+nouveau@lfdr.de>; Mon, 13 Oct 2025 15:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D5C10E44E;
	Mon, 13 Oct 2025 13:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rqRqeBgs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010047.outbound.protection.outlook.com
 [40.93.198.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A146210E44E
 for <nouveau@lists.freedesktop.org>; Mon, 13 Oct 2025 13:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2NleZDlAP1FbVDOCvb6B+h8AnyHySwcqeupCkw8QsPTjfnogGRmKQzcge56yHm+rVRUM28srDCuGGkOHh5wi41PvPJGyYbgpeXH6BCZ60VYb3IjrWCCCqqMrCb4THGXsa/QAfVQL2RGE41N4LyvAcWFF2oYNl3n0KRn7YvibA/LK5kWRKsIeYWLjxi90NVFdIzOAeBpCTqiD1nOwyNrG3SNKmerKhqVP9R5TIvakMIzuCn5MvRKPaDsEy9tWAAep55lraNq4DHqnmbaPpZjh0yJerXuCe4tT4kgo2HalRLcMpnDLZ3pjQddpT9xuN+DJ9FxipUR+uaW7yMoGDlqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YnXQGi6Hq0CNZ37wWjgHYrq6HNeSNS8iLZZFohAXzs=;
 b=mavbPPGm8+9ZMNggO0zSDRLCmmB2p5JesWax2D5HQ5gOf8AdmSG3lLpQPjU4uxFiEVGgLrZbtymWRYGGyaLXNi920jTkqmMng3uo5Y6HuzZlm07P2DAUn8pVz9RbpU3M/UQ6OlHtpeRktBGMEYjevN5RQtl9sRFU2mZAZ+nm2U2tX7TAU1H6uqL4fcoZ3jih+o0FQh2umwvTWd1DMEoqTZeJbpEK0ROyvp6oXL1ixxM9RzosHY7ocpLGiHLrWATt/7lGvUVg8NDGyoe6fnCVl21H1L2cctZEp7KVa7RwWfLqBjdrNCh1Y3zETtQF03GJIVvSppde/27UvCgVYA09xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YnXQGi6Hq0CNZ37wWjgHYrq6HNeSNS8iLZZFohAXzs=;
 b=rqRqeBgssUxjlwYUlQmpOhGIq+K1tSj0Qddl22W7tkjK0JgSrQ25aHwl5maqf05Ft3xNYvDx3J/ZOVfnsmysLeFFEwZC5uh/MzQBV5mOCO9Lk9wYR2PwMHUoMIKxpQOyGjdOfM14fU97QuZivST73KBAYZQsebFd5z+INNzu7jWf5YzqqiSkVwwVM5tfjv4lO7ma9G2rq+nVUuW04+vVqE3Z+ttUDbVssLmH/jNCLwKnKO1DN1IBYAw3rKmqNTs2iAJlIFDviu1cxgd9XpkGJE5fGSgL43ueHKXsiAVaJTDPOFbKjnmjcc0zj5zB7C/KAiQSTsur0BPbrwfG1uBX+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV8PR12MB9618.namprd12.prod.outlook.com (2603:10b6:408:2a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:58:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:58:57 +0000
Message-ID: <b13c6327-bd3a-448e-8825-1cf81bb16ef5@nvidia.com>
Date: Mon, 13 Oct 2025 09:58:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
To: Yury Norov <yury.norov@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feong@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com> <aOflmmHe8O6Nx9Hp@yury>
 <DDEJ3X0C2RNH.13YEXJI3CTSPF@nvidia.com> <aOlAQaDo5HwlvRUk@yury>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aOlAQaDo5HwlvRUk@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0021.namprd12.prod.outlook.com
 (2603:10b6:208:a8::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV8PR12MB9618:EE_
X-MS-Office365-Filtering-Correlation-Id: 40146718-fbe2-4bdc-3943-08de0a60a76e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGZoazZOVVhTZWd5VkVkc0JXcjhWTVV2a1hLMWdmRUI5Z2V5TG91QmNzbkdp?=
 =?utf-8?B?S3l0K1VuUzltNjh5dEs1cHJOOGVhbzluTGFvb1NSeUI1bXU5NjlML3c3S2w2?=
 =?utf-8?B?UFB1T216UlVVSm92cEpoSzZCZXhHTjc2VWVhVklreVpHblhUNEJ2NVRyNXRD?=
 =?utf-8?B?TzdQT1c0eStpc1JTc2sxVjI5cENtMVRtdjhhVE5JL09tcWlkdnA0alluelc4?=
 =?utf-8?B?Sm5OcXZsT1NWd0V2d2E0UzJPQjVuL2pHbDRpa2pjZjlZdi9GeWoyeEhuUm5a?=
 =?utf-8?B?OXlpWGVQbWoxR2JDZ3lKcGN2b1dSYVhxQ1pLMFg1WmQxOXhFYkVRT2VuRjlp?=
 =?utf-8?B?Z1VpNzNlWkNqU2thS3NRTFB2QmlETUlsb1JJcTNCa1RwSjNOQXVHcWp0TEtu?=
 =?utf-8?B?TWplTlE3L2FJVUJXM0c5bG9ibGRCTW9HSXVIVXVJdWI2WXVXQVJlZ1R2YXYw?=
 =?utf-8?B?eldCWUtNRWJYQ2tUQmxPNTQzcGlkalpXT1VHbnE1QWRGYUExRC9FMWJSb2pu?=
 =?utf-8?B?UTNWWTdQNmcvVjhnKzlzSExzeVkyUyt5aEZlZ2kxK2JsZWNwcGpXMGtmRUt2?=
 =?utf-8?B?UXJnUnRZN05NU0lEWk41c3NuUWF6ZXhoamFyVDlkZjZtS25YenlkSEFUUXll?=
 =?utf-8?B?VzFoWTFQd0tSL1kvejAwWDBmRGVxQUllZkRuc1ZVVUE2RHRFUG15UGRGalNX?=
 =?utf-8?B?WEo3aVh1QVlJcHRmaldQejV5L2dJbUdzbjgvWU9BK3p4c2U4RFI3UGhEdWdu?=
 =?utf-8?B?YVdiS1lnZWdxRzlwdHNYazJsVWVYM1JVQ3o0MVIxOUJzVFNCdEtlckZIUDA4?=
 =?utf-8?B?YWxLRzAyNDB2ekNPWUFEWUhaOXQyeTNmWjBQaVFDM0JVMHd0QkRxL0tYOVBT?=
 =?utf-8?B?U3RKbi9GM2xYc2JiZkh6aFhEOWx0RHF6YnJRSVNPd0d6UTJMMmZxKzBFSDVU?=
 =?utf-8?B?UExkdVkwTXlLWWt4Rm05djdkUk0rUW5Falp2ZE5ydUUwOEhxbUtnS1hjOVRH?=
 =?utf-8?B?ODIyblZqV0FRRWNjZ0I1ZEJ3MkxCczFhTHBFSU0zTU03M2E5NmdmR2VDejZx?=
 =?utf-8?B?d284NEw5WFN1Y1Mxb1N6a2R0UnNqM3p3ZWtBOTZ0MlJ1eVV4czYyemw1NlRz?=
 =?utf-8?B?WEVlTHpmVnU3ZVRKSVkwd0xBRC9CQ1FtUVJKTloyWXZxU3gzVncrVWdLT2tu?=
 =?utf-8?B?TlFqY2M4VVNNdmh3VXdPSW1FdVA2WjFQc0llajFFOGY1a0pZOUtKcyttMWhT?=
 =?utf-8?B?Z3ZwU3kzdlNGbTF5OUd2elFFVmtOSUdkMmM0NGVXbkRBMERNV0FiR2g2aTBF?=
 =?utf-8?B?UHlzYjEwZjRqS045WmhWR0lVcENOaUdoV2R4R2V3WUNDR3ltSjN2d2NQeUJk?=
 =?utf-8?B?cE5Xd1dqSmVJNTF2T3dUdkNRWWJYYmpVZUZibE0xdnV2Zkx6WDhjWm1tOHZZ?=
 =?utf-8?B?ZDB1VHZlODVGZDIxUTZ6QVp4eTIzRFJ2b1FwV0tYVHdVVWZaQjF5WEtndzVG?=
 =?utf-8?B?ZWhydGtzV2loeHVDNkFnMW9zcmVBUmY1NWhGUk1mSktUNDdmNVV2YUw5OHlZ?=
 =?utf-8?B?QU03V3dsNU5rQldGUmo2MGV5VlhlNCtpaXRkUDdYQXFOV0RoRVpKcWZUaXNL?=
 =?utf-8?B?MHF5ZnF4azY0ZVNJZTg4Szl6L0tTa3MrSFAyUGgvWENvVjY4ZnZkLzF3cXoy?=
 =?utf-8?B?dmtlcnZ2SE9tS3dmUlNHVmdudERxZjdzN3NOYmQxbmhIT1I4bCtKVU1QeXJT?=
 =?utf-8?B?ZnAxaDg5TEFtdEpHWDhBa0NTVzBnenVJaktLZEhWdXdZRzAzSHlqVEVuamJp?=
 =?utf-8?B?U1dGaHNTT3UrTW9wOUdrd05TeTlPQk55ejN2T3dWUUhNUmJKaEZNTXdkWVdV?=
 =?utf-8?B?MjN0MEpEa0RsOWxZV0V6ZFRVYWhFK3FRWE5xeUlSeDVLd0ZRWnBCbHRoQ1ph?=
 =?utf-8?B?T3FFaGxObW1KTmdCa3hLaHhMczU5cnR4cmN1Tzh2cGV2SUhyV1ZXY0xydmlv?=
 =?utf-8?B?b3NWQVVHYXlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0RKbVJtV2RMaCtacThIcEpDZHNMY203cGFOUEp2aFUrWDl4VjJYMzZjOFpx?=
 =?utf-8?B?ZmluQ25Kc3pKa2NINXRYV0cwdWpoTUQvWnpYSUw3aXU1bGRuS2VTVWsrQnZo?=
 =?utf-8?B?Z2FpMUxNMC8vTEZtcTV5NC9IS1lRbUJmNTZ6RDVtY2EwaktKSUFRR2dDM0pq?=
 =?utf-8?B?WHljVTR0V3EzVzAxZlY1YVpFbzhhQi9vWmtKUmljQlZzcmNOYmFzdEZsamtz?=
 =?utf-8?B?aDNINWx0UWgvbXlCYjVrYzJlcnloUldIbTlUQjZ2VEhMQ0hLMEVWUVZxYmM3?=
 =?utf-8?B?L1BSTUk0c3pIUHNmZk5YcHpjRUIrcUkwL2UxdUZCR0lxSWVNbmprRVV6bDYx?=
 =?utf-8?B?L3lTT0VjOTFyV0tNM2lIVEtGeUZUbVZsUDNxTFdjMDR2aTJNVGJDTGJMOWs1?=
 =?utf-8?B?cU1zdjYxOCszRWpMM3c5bXhpdThCUVhMWXlvaGw5SldNcXlCaDIwOVhBYkQ0?=
 =?utf-8?B?Uy83ZkpZZjgwdklyeVZTTHhNeTV0aHZwZlpOUEt6STYydm10cEE3ZlRVZkRV?=
 =?utf-8?B?NWQwM0M2TVpWSTc2TytDcFRtZzdOdHdnWVg2OGtCZmJsOVBFN09heDVhNDVi?=
 =?utf-8?B?YUQyNUtLenUyRVk5M3Z4cGQ4dlZQcUtXK1BWdmppYkRrSW5Sakw2YlFKczdt?=
 =?utf-8?B?dDYxZnBCUXNGSDUreXhKRmpUTFc3N3lmWFhZS3J1TlpqM2VpaWF4YXZGNUpv?=
 =?utf-8?B?NlNQbEZFTmJEOTRKM0tZZldEMCt0K1R3eUlXc1dZNmVGSEhxT210S2Y1OXpU?=
 =?utf-8?B?UzlBeGl0UEZRdWl1WlhWaWRjbmZjbTJSbGh3dXgyYUhIOVBUOVlBQzJVVEJi?=
 =?utf-8?B?cmpnaGk3ZkJYR3JLSzNla28vSzNxQ2RKZmk2akhmZGxsUmt4WXBNaExRUUpo?=
 =?utf-8?B?ZFM2Zm5TS3BvVEh5ODI3SDRJMS9jemo5L0pVelJ5UlU5WDc5WERlbTZvZ3NS?=
 =?utf-8?B?dlNJcExheWw4Q3c4UWR5NytOZTdKK2FIc2RmeXBjbEEyTmVUcXFPVVRESkh2?=
 =?utf-8?B?ejRLQnc0SDdDeThhN1M3TGVzd0Z2Zkg5S0p2NzNIRnVMS0M2MFM1T2pUV2RL?=
 =?utf-8?B?bDlMZkFET2pRNUxwdHh1YlRFWVEzS213dG1QVnV2Y0ZjcmErcEJKdUhib2Mw?=
 =?utf-8?B?QkNYZXhhSzhTV1RCUmNPN2xCSDZhTDRaRExtL014cU56dHpBblhyQzBIOFZB?=
 =?utf-8?B?ZnYyVk10S1VjWTBiS0pZUTFlcG41ajZqZVVKMTlicXA3OThBYjg2UzZRS1py?=
 =?utf-8?B?YmhQOFJxa28zRVJPOVNrRmFoZWNXY090NmJiWlM0UHorQzdaM1RlSmtiZDdE?=
 =?utf-8?B?VXFPWmJWNjNpbXJRc2lRWitkREljUTh2N25Vd0Z5QWJCRjJkekhCNzZiK2x6?=
 =?utf-8?B?b1ZXU1lNb1JCYmZkcmpJaWFmMHo1azd1cTVXR2RSV2N4dkxLYktqUEZDN05T?=
 =?utf-8?B?SDJtN1R5NUpnRWg0VER2UzFTbWwwVDZkanNkQzhrTUlHU1d4b2Rmc0dWdXdx?=
 =?utf-8?B?N0tvU2k1aGUwTzNrbkhzT2RHeDFNd0Q4VnVCMEp3eFlSWFlaaU54THpRZE1o?=
 =?utf-8?B?SnpSRXk1bUFEVnkxZjhSNnN3WTB2RzBHVVZIZmZ6bGpLQ1Z0SDZtZHYvK0Jy?=
 =?utf-8?B?SG1ROG9yN2RieTVuQThTQ3lad0taN2djL2QvUVR6RzR4TFQzWWRNQ2d1a3FE?=
 =?utf-8?B?dys5MUlBQTVVbURoOFp5dUVmbnkyMXIzWW83VERuVWZQM2l4ZUpiR1ExL3Bj?=
 =?utf-8?B?MFo5bGdrS25BMU9LSmtGOExKMVJmaStkOVByU2JCM2p3MGVnK0U5dVFFeGJh?=
 =?utf-8?B?QitTNXUyMzJBQjVLNW9qUGh1Sm9OWmRqdHM1eFdwbG5melBEdWp6TjhmR2Zm?=
 =?utf-8?B?QjVpejJ2bjd5a1lKWkVGOE91dzF1ZkUxeDE0L0lPNEE5QkQ4djd1RDZLbkE5?=
 =?utf-8?B?L1lLU3ZBVWRsam9ic3J5R0xiQkxTWVptMzlBWXJVZ0ZwTVlwaVNlOWhqMXU5?=
 =?utf-8?B?SEFmSm1iNE1pb3pQL0lVZ29PenlDRkZ0VVg2UjVSbTlFUDFBMTBsL1ZWbHpt?=
 =?utf-8?B?M2t2VmVUa3RhdVZ6TlFLZXVWU1NsbUFWZzNtclhKdGNPc2hSSFh6cnFhUnRP?=
 =?utf-8?Q?vXK77U/fIqe62blQ0KxPr+Dfh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40146718-fbe2-4bdc-3943-08de0a60a76e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:58:57.6853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfUkbVFy8SoIrw3RY/ODHkRSXeBGNWgAObzt7Xfk88aqpFNcctjx0BXtkMSo+tjsWCwQ2zmMYoexV9OrN5PTnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9618
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

Hi Yury,

On 10/10/2025 1:20 PM, Yury Norov wrote:
[...]
>>>>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>>>> -            .set_base((dma_start >> 40) as u16)
>>>> +            .try_set_base(dma_start >> 40)?
>>>>              .write(bar, &E::ID);
>>>
>>> Does it mean that something like the following syntax is possible?
>>>
>>>         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>>>             .try_set_base1(base1 >> 40)?        // fail here
>>>             .try_set_base2(base2 >> 40)?        // skip
>>>             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };
>>>
>>> This is my main concern: Rust is advertised a as runtime-safe language
>>> (at lease safer than C), but current design isn't safe against one of
>>> the most common errors: type overflow.
>>
>> Not sure I understand what you mean, but if you are talking about fields
>> overflow, this cannot happen with the current design. The non-fallible
>> setter can only be invoked if the compiler can prove that the argument
>> does fit withing the field. Otherwise, one has to use the fallible
>> setter (as this chunk does, because `dma_start >> 40` can still spill
>> over the capacity of `base`), which performs a runtime check and returns
>> `EOVERFLOW` if the value didn't fit.
>  
> Yeah, this design addresses my major question to the bitfields series
> from Joel: setters must be fallible. I played with this approach, and
> it does exactly what I have in mind.
> 
> I still have a question regarding compile-time flavor of the setter.
> In C we've got a builtin_constant_p, and use it like:
>         
>    static inline int set_base(unsigned int base)
>    {
>         BUILD_BUG_ON_ZERO(const_true(base > MAX_BASE));
> 
>         // Eliminated for compile-time 'base'
>         if (base > MAX_BASE)
>                 return -EOVERFLOW;
> 
>         __set_base(base);
> 
>         return 0;
>    }
> 
> Can we do the same trick in rust? Would be nice to have a single
> setter for both compile and runtime cases.

I don't think we could combine the setter and try setter variants on the rust
side, because the former returns Self and the latter returns Result. Also, both
the variants already have compile time asserts which may cover what you're
referring to.

The try setter variants in fact are not strictly needed, because the user can
provide a bounded integer (after performing any fallible conversions on the
caller side). Alex and me discussed adding that for a better user/caller
experience [1].

[1] https://lore.kernel.org/all/C35B5306-98C6-447B-A239-9D6A6C548A4F@nvidia.com/

Or did you mean something else?

thanks,

 - Joel





