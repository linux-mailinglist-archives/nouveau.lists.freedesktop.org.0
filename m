Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8470CCB910
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 12:14:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E70610EE64;
	Thu, 18 Dec 2025 11:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s7nHQbyq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D1AFE45668;
	Thu, 18 Dec 2025 11:07:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766056024;
 b=nv3Eg4+5TVWTS9ffijV8AZv1fghfOu0zLQoYuO3fbRjHPpWvoP5lGQPIGs1iQSWjJ7Xrd
 VYpH3jZMlwV3UR+S6HkHngkObEE73KJK8B/tfE2B9oSvsklxsCFPsOo/+pI2JMrp7TzI2xZ
 8QJPraUq7aUdAnNcXWB8wHS2tXf1R/nZhOsmD56WmX/2LXbfh8H5wyAfzh8uuwzvuq1V+dG
 ICmDLOnfLccf9ZJ4QZfeJCNQcwzJMKRJE/8LUgokgwY6CGqKrEzP1t98wTbP1RbFqEajeIc
 kY2KwU2loGGVycC19dVwiSEdoZJbjwsBIsHbcWoYaz2ZuuRwrHROp0P28IiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766056024; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hwHuANfdzxFRAajRTqLVKSFsjgDsRAvwext9xtq01tI=;
 b=Z4bjDWqH3I/Dn6XzxA+nepCdrS1b1U41ssdsiHal0W1LR0fZJyKArm1YPSjgFRH6pk+TF
 Ek9NRemg0A3V6ZkA39wdy621a2zPpP7BVOCo89xaW+kKHuAfrEAiZLU7RSrNJ/aslcRhQCs
 S4YuPS0GTyfrcNVNpZvwY91n2dW1VG6qDmaJDbi5SnhPFPAArJFtqE5RPL+fpnnnI0Ipigx
 g4y4JszzBY38T85n1EYrXpQ90xW5vJRwIrF2MhIv2HQJ8BwVvNnKa0I/N1yiQUR6bzwJ3pe
 V4yy5FYWcNCWYWIGbhhENxeL5Fq/6OmE38VqaUz1/B8kgapWej5PkPeSFt9A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8C9D644B30
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:07:02 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011064.outbound.protection.outlook.com
 [40.93.194.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C73AC10E3CA
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:14:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5dymher6pyWwjwyOLXotHIbmV2T2j262dx2UswnTKXhQPQDD6j1spDpQuyir9EuoYY/nCQa8Ve0eKRjRKkXZuxG5LDDKTzj31jRSkRPeVlxdGOn0F60qbz4Dj6HNErgPNfx4I9Igzt8IAagZJWN8u6v7iG4JY4hiO/TyEU15bEf2cUHGI/4ex6NpW0Lk/EXabsscM+8o9uHlzrDp3NDKTOSSHjLeLoQuhDqWpEBh8eMnOmpqUkPHR6c05ctvb2uCpFNfC1sIx60mM1mocjfw+1JDgAmJa3bpsiLrg+gIJxAh5khkE1t0LRNpftrHUYiYzlQdOB/4seqVqac2oi/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwHuANfdzxFRAajRTqLVKSFsjgDsRAvwext9xtq01tI=;
 b=wk0KsJgkOmFBOfU5EqttVZobg97bCqYEuLrqGPynurYamPnt6MytrxVI3ieKmItO2yuy3/2pQC27G6h5XZg6maJBc0mdNnsjqP2Vo9Agz8ApEycgYga9fhoDQLE1UJjBqTlLiXbDoAd0+a8r7GtvxpjBp8TlbQ5UIOP1ubr+iiokEKY5bL5k1n6IA6nzrfl+iFVqI/ywI2yswDJAm9Tq2X+dVZ4NkkcyUp0PPpNfyl+x6qgYvQgq7k/6X9lNXypSUj8poEMqNzWqGTQRtmGpEQEmZBdQA3X5LjEk0Gae5KQCGNCpPcv4ymtBVRG61C07yZZ2fiMMDKDTisquTB58IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwHuANfdzxFRAajRTqLVKSFsjgDsRAvwext9xtq01tI=;
 b=s7nHQbyq42vK9mBWshdDk2aJkdvxxSpFfN0ah7EvzanuRCltmQeYknjnRtIZs9gxi+S5HokbhFv8RwS7+4HcBE55Qkw1KTGpaQBHOqf7GqxJhKonDTcRh35gNxmQruX32DGg3ay65y6Qzjj7q45PzALjkeuc+n5vP6jhL03oKE/phnolHOIs0aXEHmHvmGsOgyWJhicbrKnsD7x7dsBvpG6BJGfxoWVeYUWg211v5eC8VS4UAR/2hPc+qUXmlFGg+LoBXEWYTL9Ydl1ZUlRLv2EzyzY8LLHem6RgyCw+JTzkOTFKJB6SvpUvuKtnV//w/64TYNqo0zjFiAKfLo3Miw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 11:14:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:14:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 20:14:22 +0900
Message-Id: <DF1ARMP4N97P.3SHVEW8B3EB1Z@nvidia.com>
Subject: Re: [PATCH v3 7/9] gpu: nova-core: implement BinaryWriter for
 LogBuffer
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-8-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-8-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0267.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: fe13a089-8b58-4336-a89d-08de3e269abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aktWV2s0QXVXRy9NYjRhUGQ0ejZTQ2cyY3dka1FmT3JEOFFjVFJXQU5NUjVF?=
 =?utf-8?B?UVZ1aUNMQWpnajBqZVBqSXlHQWhJbDRmUU9pazNGeUVSK1lBTjQ2anNoYk5I?=
 =?utf-8?B?L0krdGJKT2hLZG95cnhPT0VwS3FRblBRbFJjK3hheVRiZnRqUkxrMzNJRVRq?=
 =?utf-8?B?eFB6REgxb0pqN253M01MYm1ZTm9BUWROeWNDMWFiUE1NcUJ1blN4ZmZ1Zkl0?=
 =?utf-8?B?Tm1FTldUaG9IT3VTYmMrbXgrVzk4VDlRT2ZtZjBYeDRLc1Jaa3o1MUVIbDd1?=
 =?utf-8?B?cHgvSW85MUZPZXZRZFlJVU1EWTlOZEVtRW9VZEVTZ0lidWpwbjZtN1BPMWlJ?=
 =?utf-8?B?UUUvaDQ0VjY4YXVSZy9CKzc2bjVIekFBZXQ0TXlhNFRtMlZnUlN6T0FCdmEw?=
 =?utf-8?B?UWpLOVFjYTcrQ01wVlBscXd2VCsyZEtnVHR1R2tFbFNmS0NDSmx1OE1xYnJm?=
 =?utf-8?B?SWNyN015M0RQL0xDdThRVmUrN1lURGZaYm5pNXFuem9qRjRYM2xyYk9uSUdO?=
 =?utf-8?B?TE9tQUc0ZDFWbHRZWXNxRldSOTNBdml3OEdGVms3TmJqQjRTQ3llcm1BZ1pr?=
 =?utf-8?B?Z2hET1JuV2N0ZHNYOElHQkhHTGNwQ3lPeTdvRnNPSVpLTm45cnFsb2hSYXRW?=
 =?utf-8?B?OFluVFR3bDlXcll1UVNjQ0lUZi9JVkRMVHcrUkVOeW5mMk1uZEEyUUw4RlBy?=
 =?utf-8?B?RWVmSUxqR3I5V3ZVZG1IOVhpUnhORHBkVEQ3TktGUUtMT1kyUEN4VXliZEE1?=
 =?utf-8?B?SnRMNUhWclExS05UV2NkUEhNSFBpdDA4Ti8xM1pRd3lubldYVkJzOVd6TjVN?=
 =?utf-8?B?SUVRL0lSOE9QSjRIVXo1bUZQWHBJK1prcGVVRmtpUjBnV083akp3RW5nSXNV?=
 =?utf-8?B?QTBQbHY4VlpwdXJkQ3FndVJma0xwalF0S3BEMzVRV0FlZ2dzUlNNTXY1VTk1?=
 =?utf-8?B?VUNYSE5WUGFpZVlQTEROOWM4d2hsZmU4S3lMcWQyZEdhNXc4KzJnSDlRU2hC?=
 =?utf-8?B?WHVZZzIvMkpoV2RycmVrT3IrQjlYZ0xvTW9MV3FWS1I0S2cvODJyb2cxaDN3?=
 =?utf-8?B?LyswaEdNRHRjS0s3NFg5TVRtSzJEejR0N01HdklJQzFIcS9BdS9SOXc2cmlq?=
 =?utf-8?B?c1pnaDJRdTdpWHI4VE5VLytTNThYQVlYbnFxSTZqNjIrOHVuNWVRQTZCOVdG?=
 =?utf-8?B?Ukc0VitVYkg5TmNCZ1YyTkNacWo2czA2RHYwYzZVSWZGbzVpNkpRZElkbVo2?=
 =?utf-8?B?cWZaQ1huQTNsZ3A1UGNaZFdyTW8wdFBzY3J1TkRVcFV0ZEN3S1dFUTI2d1Bp?=
 =?utf-8?B?Z0g3ZktzNFpQZjJZenNOZHVaT2lxOTdUdDZyTDdxZ2E3UUFJZXBkZi9HTU1l?=
 =?utf-8?B?YTg0dytsZFEvT2YzZHpOTkgweFFtcDEzT2xqMkovYnVCRjN2UHB1YUJBaThj?=
 =?utf-8?B?V2p1ZWlXU0FpZkVRNXNPL0t3b2JWQnNramNrTjBkS0tIVVdaNFoyRFRQblRO?=
 =?utf-8?B?L1lpYmZURE5COUx4U3l1am1sWGE1OE03bjduSy9mM0gyYmNPSnFDTkUxeVFS?=
 =?utf-8?B?eWJlcDV3eGZkRjVtbzhzOFpqN0NyelV1NUN3L2FyNFpGdVBvb1lSSzFqaHRh?=
 =?utf-8?B?aUowQlF1c1Q5NmJuSXhpQTJ0TXZBRmo3VG0veEtnOVZXRVZ5NXo0WmVGZDVM?=
 =?utf-8?B?MCtlcmVLRWJHUHhWUElibWpFQnRjN1dRK1ZVWE9lMVN1MFZBczNub3RLMDcy?=
 =?utf-8?B?VCtmbEY2bGhDL0M5eC8zSTZ6ZkltN2ZaOU10L094RTBSTzk2YzRiWXBVSVNa?=
 =?utf-8?B?UDFCeXNwb2ZtZnlSODZ6SDlxeXA2QlVFVktuaEhEVm5hbzZyUzIxamszYnZM?=
 =?utf-8?B?cjRnb0RMWDBCei9kN0VmRlQyR2t5NHNRRTUvU2gvK0lMTzZTdG9wYVVzLzlh?=
 =?utf-8?Q?p0tpfw9XuSk64I5bA1xNvya0uEbztUJ2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cm5PMElNREdidVI0Q0xiK3lTSy9KSWkvbElia21kaFI3cElkTnI3N3YzREJZ?=
 =?utf-8?B?V3BFbGlmamM4UnJkd0pBM3dUamJzeE4wODVZdnoySExTVmRnU25EN1FNSWpJ?=
 =?utf-8?B?MGJodFJLRWhDZGZtcmRyMm4xK09MR1l1VXJTbEhhaEo1T2VNeGdtMmc2WUhu?=
 =?utf-8?B?Mi80cUw1L1huUDNFMGVCUlBtUFoyV3BoRUdDVjUxSURzMFFXVmdnT29qNk9V?=
 =?utf-8?B?dGpjWjZOSnpaL0o2YzZvVno3TysyajNLWCtFcHVHamRKUUdSZTVITzF1Z3JX?=
 =?utf-8?B?emlVZkhQclF0MEo1ZnNCbHBpZmgzVEI1MjluVGkvOCtlR1NtUVlBbzVzWjBW?=
 =?utf-8?B?WkhtUURkeEFoZXRWQ3hjc2JRNUh0bjdIM0ZKRC8rcWJZcjRmRjNRazNKT0d5?=
 =?utf-8?B?clZVb2ZkcGF1Q1MxdzU0b0t5WUlSdy8xcSt3M1NtR0UzSkQyNVJGNUFnM1FU?=
 =?utf-8?B?U2hqUHB2ejVjVUFCMTFmSTdZY2prVHNOR2xaclpUQnZuWU5ZYWxtaVVNSGVO?=
 =?utf-8?B?VDMvTUswa0dmeU9KRlhRemtHWThoRmw5YmZpNmZoUEZHT1Z4M20xcEg0c0I3?=
 =?utf-8?B?WThQU01WajdyL3VCaTJ4K0kzQmdtbVBnNnRjZ2JHVFdUOUxxbS9tejBPMzdM?=
 =?utf-8?B?TTJYVG02UU1IY3RXN0cvLytIRm5pamJEdXZwbVIzVXZYL2Y3V0daRFJHUFFz?=
 =?utf-8?B?YU5uYVI2TW1GNHY5WWRnLzdocTRIdGdJa0xyRGpxMU1rNWYzTlZab1NOaVhZ?=
 =?utf-8?B?OHprRnpQci9yQUs1bTRNd1V3czh5cVhqRlV3Q3dGR0plSXNFb0p2aW4yQ24x?=
 =?utf-8?B?bE1QSDR6alFVSmpaK09hYjAzZDlyQ3JpSEFuSnJuZjg1NWErQk54SVFCdGxv?=
 =?utf-8?B?NDQ3N09JdHNlYktkb1A3ckVEbExIU3Evd1lZaXpsdTgvUG96Vi81Kzd2Wnk5?=
 =?utf-8?B?TFFKK05FeFdLSEMzejdJTkRYdWQ5L2d0bjFhQjhEcm9rK2U2cEkwbktUMFVt?=
 =?utf-8?B?L25kNk9lNVB5NWdFNUVHTzRDQU0rUndWcGxBb0hUWFJPcTZQUVEvcFhPbS8r?=
 =?utf-8?B?NGx4TXRDR3g0QmhtQjRjRmd3K3NKcThOMU1ISk5QUjE3MTdhUWRrMVliS2I0?=
 =?utf-8?B?TEQvTFhUWHJnNDgvVXdZRHJISStEcGgxMVE4TlZNaFI4UmYyNUpyUzl6eFBp?=
 =?utf-8?B?M3VyckpzN0xNTlVscHhtZ3hhNDFOR2p3SlJDMmNwVEw2SFVHS0xCcUovc1la?=
 =?utf-8?B?R3lBWmtrTUxvY1JGN2xJWEJnUGhZQzlBN0hzNkZRclo4MG14UStoNk9EUzc3?=
 =?utf-8?B?MlBQclJUeWpxeEJadXNyNHZzcGIrUElNNmNiWjBLcjFzcXZ0QjRKK2dKV29z?=
 =?utf-8?B?NW5uNWt4dW45Q05Yc3l4V1BiWThGNjNFOFNvV1ZEQXNvaDh5ZjV2Z0JMR01X?=
 =?utf-8?B?TVc0M3V6VUF5OEVMOHdSRkt0a1ZjZTd6aS92TFRDMW9tRXlDV3ZjSGt4cndJ?=
 =?utf-8?B?a2M5K1Q1MUJJelc1dy82STlRckxIQVJBaVZHMFRNd0tCYXlhc2YyQ1Zmcmhr?=
 =?utf-8?B?MnhkYk1zTU1jUW1id0d1WjA5NnZhZkJORFNlRFZPeUlyNlp5aWh6S204emVT?=
 =?utf-8?B?N1lmeDllSnNOU2RmWGJmTCtJSUZoUjBjczIzSG9wNlpibEZmK2ZwT1EyT3VW?=
 =?utf-8?B?bVRsRUw3L3hxQlFFVC96aExkV0V4eUpjVTJoRkJSY29CTEpJTk16WEJDV3NV?=
 =?utf-8?B?OUNqQTlKOUE0OXBkcmdZbmNTblZpZjdSeW9QcWNxNVJudHVpQVVBVjJUR3Vx?=
 =?utf-8?B?RXBUVmtYT1hxYnpHcWg0MkZRVTVya1VXQjM4UkN5UHVjL2MwOGgvZjluRk1k?=
 =?utf-8?B?ZE16alNBdjF3MXl5aDNtZUZITjFVRW5ia010ZGlBa0FzN1ZVM0NPUy9Mc3dZ?=
 =?utf-8?B?VGNRcDU0eDlZcjV5ZUUwOVhGZXdrTkRHbFM3cWVJL0lUSlpLQitnOWVrSDJv?=
 =?utf-8?B?WXR1cG5YRmIxdXdGcFRPSnJQRWIvQ0V1TmlsWmU4WFNoS0pSZjBXNDYvaVQ0?=
 =?utf-8?B?WkJLanZZZk81TXdOd3pPVWY2ajVnSVkvRENCMDYxbHA2Q3M2ak1wUW9IdC9O?=
 =?utf-8?B?c25Xdlgyb2R4aDVyTm5sUVVraEJvQUpxZFplVzNCSzU5a25Ydk5BMUV5T0RQ?=
 =?utf-8?Q?5SBiYLIW4ylJSVEXl811FP2SMsSiCNJGuu6QNWDVBfZ+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe13a089-8b58-4336-a89d-08de3e269abf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:14:26.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GNMyAb0kFSHooirYEP0YeMKdMPOb7ulGeJgwVCY90f7vMKSOHHoNyfFRhSVgnZS//EhTrQRc/1/07XDBkV+4zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874
Message-ID-Hash: JOXMQBQG7H7OH5ADVW7GM2ZWLXATXUSK
X-Message-ID-Hash: JOXMQBQG7H7OH5ADVW7GM2ZWLXATXUSK
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JOXMQBQG7H7OH5ADVW7GM2ZWLXATXUSK/>
Archived-At: 
 <https://lore.freedesktop.org/DF1ARMP4N97P.3SHVEW8B3EB1Z@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 10:39 AM JST, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
>
> `LogBuffer` is the entity we ultimately want to dump through debugfs.
> Provide a simple implementation of `BinaryWriter` for it, albeit it
> might not cut the safety requirements.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index fb6f74797178..860674dac31e 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -117,6 +118,29 @@ pub(crate) struct Gsp {
>      rmargs: CoherentAllocation<GspArgumentsCached>,
>  }
> =20
> +impl debugfs::BinaryWriter for LogBuffer {
> +    fn write_to_slice(
> +        &self,
> +        writer: &mut kernel::uaccess::UserSliceWriter,
> +        offset: &mut kernel::fs::file::Offset,
> +    ) -> Result<usize> {
> +        // SAFETY: This is a debug log buffer. GSP may write concurrentl=
y, so the
> +        // snapshot may contain partially-written entries. This is accep=
table for
> +        // debugging purposes - users should be aware logs may be slight=
ly garbled
> +        // if read while GSP is actively logging.
> +        let slice =3D unsafe { self.0.as_slice(0, self.0.count()) }?;
> +
> +        writer.write_slice_file(slice, offset)
> +    }
> +}
> +
> +// SAFETY: `LogBuffer` only provides shared access to the underlying `Co=
herentAllocation`.
> +// GSP may write to the buffer concurrently regardless of CPU access, so=
 concurrent reads
> +// from multiple CPU threads do not introduce any additional races beyon=
d what already
> +// exists with the device. Reads may observe partially-written log entri=
es, which is
> +// acceptable for debug logging purposes.
> +unsafe impl Sync for LogBuffer {}
> +

Did I actually write all this? I don't have any recollection of
submitting such a patch (and the safety comments don't look like my
style).
