Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACDCCEC804
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 20:36:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44F2C10E721;
	Wed, 31 Dec 2025 19:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XpyYQqFR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C6F2C400F9;
	Wed, 31 Dec 2025 19:28:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767209304;
 b=eMQIEFvPf3Bijs0ycG3gQ3Ekp3YnQn7jlwR30BaheUBLRw0Ca1ibQSmzECntqD76zPtIN
 jyDJHi1cFxgN9Yy0Y2/dgksfm09dFGfm4l0z0jH/cCiQgBWo87gBvwV1DgyHp003DYy0uh8
 CjSoHHstEksUZkykZ6JfezASVvKz8cpbzbulG0CCsLN4u8umcZ/UFm0M8ehV4N0SjmWDZok
 7541q/iYklk3aBuVPJjV0hooPdLVnsEdlujZ4kP2S3l/hc/IgloHFQoc2ymcfbTkaJQT6uy
 Ws9LZWHD/32MQyBnA8qiHDBbo55xq6Q75txgfQVKcNNR4mkLubcDzAhPFwCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767209304; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Zc0Gu4GFFlqeolNundgPF93mvT3WucLuP33pyhhNdto=;
 b=yiWoWSfUAbN15R/48mXXalQBTeNaO3VectzAdbRGZJltWxsPV2zBWwcUkElQ0Yf6TYehs
 UUY477SIuLuh7u4cTHCgw6CyHTBxPwe393P6OA/Zsz5sBSCHqNHLCH6BfKTsbiDAAdhuCrA
 YoyHRjXthNkd6nsgu226kS4KhfYscTZ0ewJwOR5emX6cAd92tUriqOwfrNycR5qvb7znMhe
 qTgx2/lfJY9fybeR4NQO689E8ekeTbo4wQa/vIDQ/ddOaZBPIqj+1iX/X9yVzCA4rhQhi9B
 dwTqUDfhJH8t2FtJUVgm3mrstJIfjWe4r+0cu4osmp4SeksNLa7+wgeISBrw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9A6EB400F9
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:28:22 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA4FB10E530
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxtc/wFgDRakDcqgebVHvp51jIPSgT5RskaqtMbg9EJudrFK33OB1zObpHyX7Gva+VINRjRFqhNwYT4IFYq3rbRbBAEhzYl6zvz0u5gkVQ9+PiDvm9k8JnjHBOaT27ze5WDlPwwitU8TTYrcjKv3v5SVqPwLUpTEdjmwDmLdC3lsp9qzKQRBrQsrGn7+wxcrALp+hMAX2cg3etBYHg/5sLdE1CxFg6PxEanP3In6rRR6N58XPe5dvqOFVYsPn35oV6/MYNNsWs3JmkDSSPIkxK7U7Zsiu9RX9+UJtakrXSV0UBFGucAmbG/FVhDsc76CEpGt/BYGUxRrNRjE0su3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zc0Gu4GFFlqeolNundgPF93mvT3WucLuP33pyhhNdto=;
 b=RT9DLCHCpGfJfhOkLxZY6FwMpf0AplUGvU6jNlbe5bTJWODWFCv8T4U2JFpLjDR7NMYQvC5UrNPErsHqLBQU6wRuZMUlupZmjhEUZDNsylQ7c1foqdqeJmLVeIeZJ3MLlxsx4tFJ3bj2y5E173Fr1KYM6PDcfiKXeRr/WyR4FuZhx3EOuUq6QlopFss3+GbgIq0tLUfKxAb21+uSp/kn+CRiOomLhHKaZI22q9NqOLGPxtlq6ndZSuBvAx+NJkl2ez6GS8Ccj9lKLvLC1cF6hfMiYoyiqA6ds7cPwseaB6mH7W0rt/1f6hQDjic59tyeetej1MKtGXTOY53mjtdZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zc0Gu4GFFlqeolNundgPF93mvT3WucLuP33pyhhNdto=;
 b=XpyYQqFRS/FkDhMVgKjPRsoaBTaMqUeZlwTtAnxk3cSuinQDmR/KhDehaBRKI6wSB7uFslIro7rJhLpkKKPQNDiCgh+//EW2/PQ8fAA5zVY/8sbk5BnsmcpAvRXIfKz2xb4p/3rPFmqQhLmycWeYnhJ+9m33upgiBajyaOIt/3B9nvBWuWI6a7DV3eYsJ2/cKmvgzXyppcdc8N//3P6DxTmspIaMAOGeuGr4SToET1E5GP8wMNCWOs/mD/uW8zNGvVNmMMOXEPxw7R4CGW2/u7fkXKVLCuPqG9vji16dBWEzndhvXHQmcTcnoRa2ug/NxhgaGnLHEJe6GhZPw7cFkA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 19:36:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 19:36:19 +0000
Message-ID: <8e021744-283c-4d3c-a7ff-d86272e2e5ed@nvidia.com>
Date: Wed, 31 Dec 2025 11:35:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] gpu: nova-core: add ImemNonSecure section
 infrastructure
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-3-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-3-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8fcc71-5c80-4f0f-f8d7-08de48a3df28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RDFlZUg2WWkzbnlVRHhRZHdLWVRCSzUrZlNHelN2bndYbldGS0lRMXQ1RHdO?=
 =?utf-8?B?S3hhL1hpRjBmcW9WVDJWTDdJNGdROVdNbFRBZUZBUmJTVHBncG1DenFJUkVp?=
 =?utf-8?B?a0hPNkRPaDQxeXlFV1FZdC81anIwdkFyZkxDdTcrZ3RnSGJQSG9GSEdKRVRS?=
 =?utf-8?B?YzVIWEo3cEovM2M0SHdtZDlYaldtV0ZCL0NqL0ZUMVliME5EWVdjMHF2bzhq?=
 =?utf-8?B?NVptZi9QNU90dXprckVXU2RpUU85dVZQRnhsTTQ1cU9yVWlQYXk2YWdYV2Q5?=
 =?utf-8?B?OC9HNGo1RlRTQlhJNU1ndjFQMk5PMkNKVGFzOTZSN2VOeW96MHVqRm53NjZy?=
 =?utf-8?B?b2VzZnpOL2RBWFlpdjJsTmpSRXJxbzByRk1QZGlBUHIxREFQckZtNzZoK2NS?=
 =?utf-8?B?am94TGk0NXhaTlB4SXJPamY4VGRtMFpLYUw0ZXBlNFJGbllZUUQrak4vTzBV?=
 =?utf-8?B?cEVON3B4SStrRXhQZm1ISElLZWdXS01ZYWxacGswNzlvdW5qd294WDc3eXA5?=
 =?utf-8?B?NUNXVmR4N1JXMVNKUGszL3JXVjhPVnNDSHJlTFFxUG02d0c5d2RhTnRxNjNN?=
 =?utf-8?B?S0hpVUhBSlZoN1dJSnJkNTVsZ2JIN0hKZ2hYV05Hb2RoUW1kVkpyVUNVZ3RY?=
 =?utf-8?B?RElabW9LVG5Gc1dITy9BTFFJcjRiM0UyeGZMMXVsTEtZV2hnUkJTS20rZVlJ?=
 =?utf-8?B?MnlOT01KeXNaSEhJV01nc1dic2VuUTdmRkJtQXkzZzNSOGRiRXpPdGExTkJF?=
 =?utf-8?B?cUdwQW1kMU94ZTNPckZHVFRQNVVHK29BQU56cFlmVnpQaHhYdld5VTFCYWhh?=
 =?utf-8?B?cTlxd2xScDBJaXVka3BoTVRjZFdpdlZ6eUlMVnJPdmQxNXlxbFo4cGpuN29E?=
 =?utf-8?B?ckEwSFlKVDk4N0JIU3VibmlxRXFVbjd3c1U3RVpYbGljOHJNL1pJUG9hdG1l?=
 =?utf-8?B?SWNXb0k3V1I4eXN4cWllblFYbnNvTDlQYXVRVWxTNjB5WXplTzUxV1YrZGs2?=
 =?utf-8?B?dERuYzZkMm95czEzNDQwVnV6N1oxbHpiRDNwOG1obTJXR2x3VmRsRm1xQ25Y?=
 =?utf-8?B?TXhYR08vWDMwZTU0U3AyVktjN3lvV2gzQzlGajdyS3BSd2Q4NVhLTmRRZDFr?=
 =?utf-8?B?V0NPWDNkazBlOWwxM3o4SysxYXlCd3BDakZnbnI4bDlBb2NVVC9hSldzRUd0?=
 =?utf-8?B?SVl6Q0RuWVhxKzd1RE9vbWJqejBhNHRQK09KdXdPREhzMmZGTzNET0tWS0l2?=
 =?utf-8?B?WkVTdHlqNHJ1a0kwNHV2eC91blBZaEdkSjJaUW1KMWorZkFQQ1dadkRmUjVG?=
 =?utf-8?B?d2gyWS9iQkhZeEIzd2ZRbVBtM3g2REExQ2JTMzNhVW9hZXpVeng0V3NhY0l5?=
 =?utf-8?B?R29XcUpiamlwclFTdE1uYWRpeUdTdWswZGVBRHE4OEVpZGRHU1g4TWExRWs4?=
 =?utf-8?B?SW1HelhPWjRhRFlpYnJZMGVPendmU2RWdTcydjMvTmM5UEdPN1RDdkJjMDVL?=
 =?utf-8?B?WS9lZFNhRzZtM0ozVWhBYzdlSTBNRDJWUXRaZUlFVjRXekZwWHpCTldremdN?=
 =?utf-8?B?TW1aaTY1TnRISS9VcDE2Y0Q1N0YyRlh1YktkS0N5bS9TNDNqOFpvdGhKcnV0?=
 =?utf-8?B?Ym5yZTF3Wk9zUGRMSGg0WWJISDZEeFJrUnJad0FQNmRZOWNCM2pTRG44OW01?=
 =?utf-8?B?NElMbHpVb0lBRWZkZE9nUGNJYWgwY1hsdkFpY3FIUlZaeWJLS2RLMU1MVG0v?=
 =?utf-8?B?eEJwV0s4SHVHQ0NDSFRVNkdPOUlEcDRLNlpaNTNSZ2JjdHI4cjJkbThBL2dk?=
 =?utf-8?B?VFNybFYrTDRBTzBEZ2ZrR2MzOHg4dkRWWU9yWm80RUtRVUNyM0lUbzFvK1Fi?=
 =?utf-8?B?R1J3UklRNXpKS1gxWmdRL2lIdEp0ZXpQTlJhN0NLVy93anVsQ05HNnBIYUdj?=
 =?utf-8?Q?yZIW0sYXtDCrDLpFZvLhUBEn2eP0nzUo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2E5VHdLMjRpVDNJc2hHaXN1RWJ0WC9GczNNT3pYRDdwcFpvZDh2TEphQkdi?=
 =?utf-8?B?NUFtUmRvQW1uMlJOcEw0OVNhY2Z6WW5ndXlYMXZCTmtTVVNseU5yV3dtOGt0?=
 =?utf-8?B?QllDeTAyai8wcjF3aURVVjNPaWZpb0pSUkVhYkFiTUdCYjhrd0ErZzNYUlBQ?=
 =?utf-8?B?TWN6aGM4R1pkVFRqRDQ4dy9mZFRkSFJEVXJZUG9MWW4xWUhqbjVsZURNc0Vp?=
 =?utf-8?B?L25iL0JNaGFEZmVManIwbHVZem5WV08veUNpL3pOamJMQVZkZndNazQ1YXVW?=
 =?utf-8?B?TC9pYnArVm5TMkx4RDJwMTM0SXI1OG80RFJIa1U0Nm40QTRPWHNtRWZZd2Z5?=
 =?utf-8?B?WmNCSzZkWFVXVXFkbHpHZDJNcHFiUy9Yci9pc1pGOHBDUGZOdkR2SjVBS2pr?=
 =?utf-8?B?Ujh4UDBiREFYOXp6eEpBR3R1cGlKNFpjQjVRQ01lRlpMY0pUcUNNVjgvdGx5?=
 =?utf-8?B?UTNVL01panBKc28xR1dxQ3crTFM0OU13T2VMdm1TOGJkWWZDZ3djbU9Sbk5S?=
 =?utf-8?B?ckRjdXVaam4yOUFTQjNKbktRZExiZ1gzaTh0OG5kc1BTOHJEb2piMTNJV09J?=
 =?utf-8?B?bXlaak1JU1pUcEUzaGFIdU50bUgvZjJUMUQwRWgvRlJpNFgxc01CaER4cEgv?=
 =?utf-8?B?dEY4Q2JMOTIzQzNhaEo5YlNNbVN1SnRtWjZ6dlp2cUg5THFWL1lxb2lkQWlO?=
 =?utf-8?B?c0wxNVQxZTc1bU1LTjlXbVh1NjlWR25DRnFRK0J4NFFXWUtJckVndTh1Y1BX?=
 =?utf-8?B?WnF2dHZ0SzYyRG1yYUM3YUlRUG1hQWYvaC9DRWdZZ2ZBNkp4YlhTbmZnTXJi?=
 =?utf-8?B?YTV6U1FhWU9KRmhWc0NUejZINXNPZ3BpQ3B5N01HVEY3MHdERDBFSGVVN1dJ?=
 =?utf-8?B?L1ozQXBqRElvTEZGNkZkKytabkluZkY5RktsOHdrVzI2SldjcG5RdXhyWWJi?=
 =?utf-8?B?em9pQ3JqQU1sNTJOQmhWbGhNWUI2dUYwSjgveThYODRXTktSYUtLQndmTW53?=
 =?utf-8?B?VVdjZG9lYTNaRlc1SW5MVmJyd3p4eE9STUF6MGc3MVJOdjdrLzVLTU1oUEw3?=
 =?utf-8?B?SUZMakZKdjZ4emNyaE1xQm1YdEhXNnkrZ2F1OW5ESVEyeVBrWjFYL2k0VE5r?=
 =?utf-8?B?ZHo2M01MeDhUcHVUMHFINlZEeFFoRm5PcjNJTmVEMmtSR0M3NFhUT0E0ZE5W?=
 =?utf-8?B?ZjJHMVpxUVlHYSsrK1hhRlFJTGVBMU1vbTVnV2gxREZNbGdpVDlCYVJRaXhk?=
 =?utf-8?B?QWs2NS8xSHlqcGxKYytGaU9UdUpUNlRjeVdFVW10Vi8rQW5HK2V0Vm00bUxB?=
 =?utf-8?B?Mk1FTGJhOHZWL2ZTUjVUWUZpYjN4RTNSODJhZDdsUlc0MHdwTzhwZEF1ajg2?=
 =?utf-8?B?dm11bFQ1Y3Q5R1A4VEt6NFFqR3pWUGhvSjl6VlRaM0NGaDNzQmc2V1hiSTd3?=
 =?utf-8?B?YUNmRUljMjM1cmsxWE11NC9YbXhxZ2w3VUxKRzdHKzVsdjliTUdnNW5WMVB0?=
 =?utf-8?B?dVZUWXBLYW1LRVQ3NjhhRzc1WHQraFlMSW1UY0syeG5CTGV3V0dwUWdwMDhF?=
 =?utf-8?B?U1lmR0RyWDMyQnFuYWtVbGVyVjJBWElYU1RteEJLeWxpSHlOeHhRQ2llUXhW?=
 =?utf-8?B?MDZSblpxT1lkQStnQTh2VjcwdkFGS2k2djkwelYvOXF5Z0dLREE5aDFhNFhR?=
 =?utf-8?B?UkFwVUhMQk5zK2ZKQXUvK1VCTmNIcmQzeGZSQXoxM3RtcWkxcmpUUjA5VHpu?=
 =?utf-8?B?c3dmM0xMVUhIejV1U2lpS3E3NGNlbzJuSjJvSE94eDlpcWswTEU0RE9ydnl0?=
 =?utf-8?B?alpHbmd0L2E5cTdIQ2pub1JQSC9jbzNlSm1LaG0zYmVyOGNRZWRsb0tRSFhH?=
 =?utf-8?B?ODQ0M1h6L1VvMjg2Uk5wV01raFNwWnFOUjBxNFd0YW1xUG4zZE9yN2hvQlh6?=
 =?utf-8?B?SjRncDFvd0ZoTkNpc1JsblV3K0hPazVqd2JZeU4va2E3bEV1YXhLekhnYVEz?=
 =?utf-8?B?UTAzeUxqQ1dKcE1OZUpBZUhzc2hTSUhheElKV3EzY0tSZmZuQjdBVGtqcVRR?=
 =?utf-8?B?VVMzN09mK3hNRmZBUUJ2bXBMSUxveVJ0di8vdUV0akRJZUxYNmR6YUQ2Zkdm?=
 =?utf-8?B?WnozakxqeW5GdHJKa05oVzQzUUxjN0llcEtUTHF6YmpGT3Y3c3F1RzlkRnpK?=
 =?utf-8?B?YmhFZmJ1N3B6a2t4RTRka0NhcXBIYnFxSzZRbDVoT1JDY3lYaHhJUTJSSTRV?=
 =?utf-8?B?UkFGallBNGx6ckVCa2RxRERLb0VRWUNZeHdLTk1HTEFSemtkLytJT2lFRnhW?=
 =?utf-8?B?R0hPR2lVT3ZYRE1IZ0lIR2loa29mdE56Y0MzNEhpNDNESGlXcXRFdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d8fcc71-5c80-4f0f-f8d7-08de48a3df28
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 19:36:19.6034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O3yEOsavlIdU/yRkjVNN6nGqP6knaWpJ5Z5mMjLdOndUoh8zVOEw2T4T/oZC0bou/jlm5TCvcnS+oyvzvCBv7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
Message-ID-Hash: ATBPQPONV75H2TSSFD7INGRR2FVGPM4I
X-Message-ID-Hash: ATBPQPONV75H2TSSFD7INGRR2FVGPM4I
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ATBPQPONV75H2TSSFD7INGRR2FVGPM4I/>
Archived-At: 
 <https://lore.freedesktop.org/8e021744-283c-4d3c-a7ff-d86272e2e5ed@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/17/25 7:29 PM, Timur Tabi wrote:
> The GSP booter firmware in Turing and GA100 includes a third memory
> section called ImemNonSecure, which is non-secure IMEM.  This section
> must be loaded separately from DMEM and secure IMEM, but only if it
> actually exists.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs          | 20 ++++++++++++++++++--
>  drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>  drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>  3 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 0965cb50568b..b92152277d00 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>  pub(crate) enum FalconMem {
>      /// Secure Instruction Memory.
>      ImemSecure,
> +    /// Non-Secure Instruction Memory.
> +    ImemNonSecure,
>      /// Data Memory.
>      Dmem,
>  }
> @@ -348,6 +350,10 @@ pub(crate) trait FalconLoadParams {
>      /// Returns the load parameters for Secure `IMEM`.
>      fn imem_sec_load_params(&self) -> FalconLoadTarget;
>  
> +    /// Returns the load parameters for Non-Secure `IMEM`,
> +    /// used only on Turing and GA100.
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
> +
>      /// Returns the load parameters for `DMEM`.
>      fn dmem_load_params(&self) -> FalconLoadTarget;
>  
> @@ -457,7 +463,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>          //
>          // For DMEM we can fold the start offset into the DMA handle.
>          let (src_start, dma_start) = match target_mem {
> -            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
> +                (load_offsets.src_start, fw.dma_handle())
> +            }
>              FalconMem::Dmem => (
>                  0,
>                  fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
> @@ -508,7 +516,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>  
>          let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
>              .set_size(DmaTrfCmdSize::Size256B)
> -            .set_imem(target_mem == FalconMem::ImemSecure)
> +            .set_imem(target_mem != FalconMem::Dmem)
>              .set_sec(if sec { 1 } else { 0 });
>  
>          for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
> @@ -552,6 +560,14 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
>          )?;
>          self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
>  
> +        if let Some(nmem) = fw.imem_ns_load_params() {
> +            // This code should never actual get executed, because the Non-Secure
> +            // section only exists on firmware used by Turing and GA100, and
> +            // those platforms do not use DMA.  But we include this code for
> +            // consistency.
> +            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem, false)?;
> +        }

Let's please delete that whole "if let" block, and instead just return with
an error in this case. This part of the firmware story will never change,
because it's only for older chips, so we don't need any kind of "what if"
code. 

With that, please feel free to add:

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

> +
>          self.hal.program_brom(self, bar, &fw.brom_params())?;
>  
>          // Set `BootVec` to start of non-secure code.
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
> index 096cd01dbc9d..1b98bb47424c 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -253,6 +253,9 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
>  pub(crate) struct BooterFirmware {
>      // Load parameters for Secure `IMEM` falcon memory.
>      imem_sec_load_target: FalconLoadTarget,
> +    // Load parameters for Non-Secure `IMEM` falcon memory,
> +    // used only on Turing and GA100
> +    imem_ns_load_target: Option<FalconLoadTarget>,
>      // Load parameters for `DMEM` falcon memory.
>      dmem_load_target: FalconLoadTarget,
>      // BROM falcon parameters.
> @@ -359,6 +362,8 @@ pub(crate) fn new(
>                  dst_start: 0,
>                  len: app0.len,
>              },
> +            // Exists only in the booter image for Turing and GA100
> +            imem_ns_load_target: None,
>              dmem_load_target: FalconLoadTarget {
>                  src_start: load_hdr.os_data_offset,
>                  dst_start: 0,
> @@ -375,6 +380,10 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          self.imem_sec_load_target.clone()
>      }
>  
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> +        self.imem_ns_load_target.clone()
> +    }
> +
>      fn dmem_load_params(&self) -> FalconLoadTarget {
>          self.dmem_load_target.clone()
>      }
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index 6a2f5a0d4b15..e4009faba6c5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -232,6 +232,11 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          }
>      }
>  
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> +        // Only used on Turing and GA100, so return None for now
> +        None
> +    }
> +
>      fn dmem_load_params(&self) -> FalconLoadTarget {
>          FalconLoadTarget {
>              src_start: self.desc.imem_load_size,


