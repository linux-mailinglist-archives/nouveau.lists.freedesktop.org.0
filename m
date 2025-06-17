Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18628ADC012
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 06:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B44610E413;
	Tue, 17 Jun 2025 04:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TwZ2NGxv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7116810E413
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 04:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFv3IvKahBbo6DHiHodnZuGg87qiu+4xIvB+S26Bftwy4/Y1i4gK47pdJrHUzjjM6YIfKi3hSFEAFRs2rQPbMVrKTwPUToeMDc+c03t90tEGGtEmjnsQ6DQwoRUf+oIsYUmZJmcL4FO32fmaz+wVLPSNS8+UCQ9fXfgK8n3bCv9bneFy2SsComMr1vhqZMHHRJ8wijsSal9ngPO3mLlAWfoleL2LNpjdudcfTPyfm3KDn8gdIA/kuJbNCCqwKs+jJWoKDrW25xtqj9TfNUyhXg50jl8I+1X8ej3hwSQCcTiFqQEckZ5K5TbIMn2F/jVxwgk+fRyfoDsK4JQOFNCwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lbsb5gWjTK3kzHY2C2zkFOHlqnfvVXyNMxwM3xoHwdo=;
 b=XF1lgt3QajKBa6Qfsf43OdW//c/KOwwA7ARqZqE61bSwnxaiVAp2+4XIrHqT56Mw0fSeFlQ8KMoI4DxVTzCkTkmkWcfgbD8zuTlHocZoNNXhpmYJ3qsjApXWBbayPDxJUHdX+tJfQXt+9SuZQ9764S2qFOjCKbv6q8tdhTv48vnekpPbR633xzPajlAqATDVmT4F2GShz06yDG+8Qjqd1BvoqwWBSQk/pipZV1w/qAjFsUEU1p8eI8lN/kRC8Rg0Fysd8lwmh2gxN8zRmWCEiOEzsNMj/+UwY+qd5AmHHLR9rui10AbKwkty2yDngmkveEibxsi+FuiboAC4CB6vcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=darkrefraction.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lbsb5gWjTK3kzHY2C2zkFOHlqnfvVXyNMxwM3xoHwdo=;
 b=TwZ2NGxv6Sqg3ZL/84tTbP+H3/B6ii6vezv+p1liYtZqn6fQYhZAlyp7dXhypFbQfJEpDKkH4Ry/q10BYeJ6emuB6pPHdrAYf1uDPa315nz/qiTKujugfsHKKRtiaKRwZpaM54vHYR4RxktBMXVMqI5hjWvYUqcOYCne1ZiJtp0zhsU2LAybSxXXtwlWMZKk6yhm6A00jqGAeY3HE/hHNEdW34RPchtadmAvoN/AfABqZZ1MBdgMBYpvwe206cp8stkE7TX1/Wr8WjA/QyXSnAaOaNQ9X/pjw2pZyfiSWyFeEaCFTebLeC4q2CfMfx2og6wcCE6EyS+mQgFK99uhdw==
Received: from CH0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:610:b1::26)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:09:59 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::e) by CH0PR13CA0021.outlook.office365.com
 (2603:10b6:610:b1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:09:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Jun
 2025 21:09:45 -0700
Received: from [10.2.181.24] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 16 Jun
 2025 21:09:42 -0700
Message-ID: <5a742cb7-1b06-4e84-8de1-9dbe03f99250@nvidia.com>
Date: Tue, 17 Jun 2025 14:09:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Set DRM_NOUVEAU_GSP_DEFAULT to default y ?
To: M Henning <mhenning@darkrefraction.com>, <nouveau@lists.freedesktop.org>
CC: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, Faith Ekstrand <faith.ekstrand@collabora.com>
References: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 4faaa61d-7793-4dbf-f72e-08ddad54d382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk9uL21zMHV1bldaSmU5d3htUGhxMVNEbGNaSlIvVFpHL3Roa3dyaWFWR1dk?=
 =?utf-8?B?Ui9tR091RHYzSXZwSGN4bGhrT2VkNCs5UUlqM3VNYVZhazVRbnFxZ2ErZTVU?=
 =?utf-8?B?cUtOeFhCbGROcUUrZmwzSFJDMDRVdThqaDFXQ1JJRUV0TG5Vd2NCY05KZWJ5?=
 =?utf-8?B?emh4azcvcTZpMWRUdlJTeSt4MXErUkppMzFPVEZtdzZxckFiVE5MeUhmQzhV?=
 =?utf-8?B?K2IzZGRuVmx1eG9WL3I4U1NId2V3alAvM3lKbGdZelpNQ0RWVmxXYy9IMTVJ?=
 =?utf-8?B?TVd2WXRDa1dIQmo4Qk56bHIxeXU4WkI1R0thMFE2UjVKaFpITUMwb3IvaStH?=
 =?utf-8?B?WE5KL29HcU1YeFVZbWxTd2VVNUhFazRWWGJUWEpVM3hzN00vWHdpbUpESDht?=
 =?utf-8?B?THlSdjlEV0dqelJLRXdFVTVHS0VCNnJEZ1MwRzJkN09wS3ZPVy90a3plNWwy?=
 =?utf-8?B?ckdRbWhOTkVOS1ZNaXNiSW1JVkRpcEJnZU1FNWJTSUFnY3RxSGxSRVBYVHFL?=
 =?utf-8?B?QlJyYytDSnluekZwWDJnaWlSZ2U5V3VjZEhmSlJ1emNFUW5WaExDQnNQdnFa?=
 =?utf-8?B?UGppRmNkQW9tRkpQR21GMDUrUi9sY0JtUkQza1RneStVZFJoRENsT2pNZHZk?=
 =?utf-8?B?dWJHTHNFTG9heWxNRmxURDN4emw3R1habmkzMitySVl1TVIxU0I1YzZaU1JC?=
 =?utf-8?B?a25PV0lJenVsc0NTYXhQUExWTnd0ZG0zanN0d0puMzVjeFBQakp3Q3ZGYkpa?=
 =?utf-8?B?bWQyVUsyeHRGazlmQ2ZLWnN6aUpGb2pHOURJbTJOUWtkTDVXK1Rpbjh6UnVY?=
 =?utf-8?B?RzRDYmE4VTlBUWx3NDZnSlZNbFJsVTVVa2FNVmZleW4yeWtHSnhqVnUxODhC?=
 =?utf-8?B?SERGcDU3dmF1eDRXQkdZKzhFaG1VbGR5N1ZudUM0UERJYy9qdytlUlZFMzhj?=
 =?utf-8?B?cC9GQXRVQU9Ob01LS3ZhMUZHdnN6TkxCWjA0OXFCQWVPZHNMSDdaWXBpQnd4?=
 =?utf-8?B?NzVHRmRhaVAvR2VZWmYvMVdzWFVDcXBNSnNnOVR3V2tRRGwvL2ZWZEhtQmNB?=
 =?utf-8?B?VVVyU1NFSU9wcVVEc1h3VDhmQVhIQ3FST3BJa3FQRlR2SmRtSlM1eUFzOU1C?=
 =?utf-8?B?T2F4eUlDTE9qbklQVVlYR0JEdFZ4ZUlNMXMvaXRpbENDNXlackxWQ3FNbFdx?=
 =?utf-8?B?SHZhdnFUUnFCL1BVTVRDRVN2V0pWR1lscU1XbkF3UVJxNGNkWTFRZ2dHZlhq?=
 =?utf-8?B?eGUvaWR0SlEwblMzVmR5TzdtMVBFVXZjSXN1MzBOMlRpbDNRbFgrWEhhWHRJ?=
 =?utf-8?B?RFN3aGQzSzN3NXlEWER4NUNYcWVyNEM3ZWh3OUVvbjY1TnJlZTNwamtMYVQ1?=
 =?utf-8?B?RUNmL2xCNHExWFFJZVJFTGxXd0xKUCtndGlpMUsveVp5RUJHRVdNNnRvNTY4?=
 =?utf-8?B?SU1nMEhtYXA5TWoyQXlRbkRnTVVvend2VDRjUy9yWi9RUGNHdHdlTFVxQTVk?=
 =?utf-8?B?UXQ2VjVKOEM3NUV0SW1wMDE2ZnpHVFdGQWJ2Ulk0Y0RWYXhDSEpZZ0dCaGNT?=
 =?utf-8?B?Nmd1czVLN0kyaHJYRE4rZEkzUVhqQmwxUDJZN3dFNFhPSmlxaEF2RDM2MXk4?=
 =?utf-8?B?aW1EU29qN3IvZUFDbW5TUW8rMTYzTjBRdlVKYnNoOTZjNkt0TEdyS2dEME9v?=
 =?utf-8?B?cVdldlExTThqZVlQUU5WMExvTVlicThVaUJPU3hVRGcyaDNTaVV6aTVRZnpa?=
 =?utf-8?B?N1EwZEU2TUhIb2ZDak1pVTNBUlk5Z05DbnJWSERBTHQ0YWN2aytNdHZsWDNG?=
 =?utf-8?B?ZENHdVJLWDBNUndiNnJ3MW1RZWQ4STF5ak5NbGN3ZGJ2Ty85Mm80cTVqckRy?=
 =?utf-8?B?czYvKytteWtBTnQxY3VERWtJN2NhZVAyOEVaRDY2STBvMjJwWGp3WC9yNDZu?=
 =?utf-8?B?c0wwU05FYk5WQ2NMc01VZ0F3YkV5NXZzbERlOXVGRXUxcnF6YldpK3NXVzBV?=
 =?utf-8?B?aHNMalZaYXl0T1J5cHh2TnhSNnpUNnp2VW0wekptNW5RdnNycS9wenlkUjZy?=
 =?utf-8?Q?jp/nvN?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:09:59.2387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faaa61d-7793-4dbf-f72e-08ddad54d382
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595
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

On 6/17/25 04:41, M Henning wrote:

> I've been wondering if we want to switch the default value 
> of DRM_NOUVEAU_GSP_DEFAULT to y for the nouveau kernel module. My 
> impression is that at this point the GSP code path is both much better 
> tested and much faster than the classic firmware code paths on turing 
> and ampere. I think that encouraging distributions to use GSP by 
> default will go a long way to improving the default experience for users.
>
> Thoughts? Is there any reason not to do this?

I have no objection to this.  Initially, the primary reason for keeping 
it disabled was to give some time to shake out any regressions - but I 
think we're well past that point now.

Ben.

