Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9ACEC96F
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 22:35:58 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA2210E98A;
	Wed, 31 Dec 2025 21:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IN9RYwv0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E68F944C81;
	Wed, 31 Dec 2025 21:27:55 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767216475;
 b=bkF4aqxPZIcnR+sHTNUKKf0p9pkL/PhKX0XiJOxi3htOFgMX4eIr361t6htFI+y8yu/YP
 ncvxnOTbwYD+ebV4G4gtmZ52UNRh27qXTcDuhjm5yw5edRPmHAT3H5lBw1Y+zDfZnHF+q59
 cfkje4/8EeAA7zzlxKQ4fUUL1lJspOjIs/zgXHQBXlThACpxnHp4vURhc7g6Ch8WMVy09YM
 mHRsG/C18GeNqJFuloyBsg7lcg/tXo9w66upSKv/NCcd/CEm1mhfAeuewzv8OzXZ4BtivI5
 H6WMwbdYjjhJ2m6ov3qDvkWG7EiSId4wKmkuafnaw4Pm69S66z8Bqx47sDNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767216475; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HtwLEJmaNJlGu7juiIqggUoV6vdR9DtnzDepQbHL4D0=;
 b=qfh0TBPepzVNZJVF7blRepk+i0ubI8yl85TTTG3t2VwOSUOyS5s0f7zppJpZbbFL62Hn4
 QUaloXHzl2UrtQIfefZNcauh8iKQKXd+e+Na2n/1kQ5I2mYDn7OdQ99Tikx3cbb1p9Vuzla
 qwPFjlbBFmYBlJv0xMHI/EGjBOST0zC9Iu/Ri3RwIhScUp0sKrLtq6XheyUMf40GiAwvoLy
 9Mm+7oHLwU9t1su0TAfbHxoejkhaJ33Imwm2p+wcKW3sKiBsktsiXgXdpZUUhek3r7+CBcN
 6NTd+kJVo+EUkpooi3Cu6icSJYU53gXCAHp11neLhShz/r4ntN0U/86A9Mjw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BACBF44BF7
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 21:27:53 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010006.outbound.protection.outlook.com
 [52.101.193.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D13810E43F
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 21:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iugs34j7UrowCt5lVPcCJq8ERw/e6wlEEQrRRN8QuSyWWdtSaGbUr9Nzfr6TzMK4Uz/yUtIMNeEENsLNZSGgF/3ondaNztsFgeM/28kV7RnSqY7u8vHQwPVLAUR8olNW4Y4PPZMGyQZXlsdapMl1+ILAcdOAfqaAUMR5/SUZzMZK2Diqdawpdj0u/ZnkYp76iJ3y5TEiR/HT8i55VA5oRH1VycM/DX2XOpJUhtPDshtWk5M4d/Pqud1COkZWQOG+lT+rzIOKkmIa9Y53vCUebpn3nCTKX7/5L6a5xsM5DouxvRdWz/Cl1EbyW8sbrHHoqEdD778bxlSbbTuYq8O5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtwLEJmaNJlGu7juiIqggUoV6vdR9DtnzDepQbHL4D0=;
 b=jyCmXj4OCk6BbEjKi0nbZYlKhngulewv1yWC6eSCoX69iw/GwJaRwlr8piBfshIYTnYY7IAwHdsrWu6C7cgd7Fzd92zXRyAG4ZUb54apc6k1Uxqo4QF8r8IQE/FItR2ervPNhLU6B6Px9LktHjAKU7FGQVl0x7U4p9QPd/n3F1LhKnhHOs4bVPUA3xZ74oxYGsxfLnzKCEnaAd78O0Bj69ld3fyL3omm6iQV7UEMSDiWu5fPtY7E9PfGhla9Mia+6RcXlQ7vf6H6Z6wbmlNBDAbsyAhzN3hhJWPxeqfefNxfCMFo88NxnPWsPdrrFookU6WbmVQo61DnGMBylBPGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtwLEJmaNJlGu7juiIqggUoV6vdR9DtnzDepQbHL4D0=;
 b=IN9RYwv0zQUVhcSqkGlOno3PYWRSXzy13WkgwFtDTUhAwkxOVQnwiXTIX40HhoINn1G4wI8ku4Aotc30VMoW4r7YK4B+ijfPuf5QtYFKDa+SlrAtNp4At1a90yyv4hY+62iWFB5B4NGKR2XtYI2b2S2giqzQMV1nrFUbLvOKoiKqLhvjE6gwqMffFx6u2TF0S5ChXjk9ot6AXn+c2TXeVXWaWoO6Byw3Bim5tzctZDY6hEof+HoHjrdZ0LLCUc/AecxFnKImnH3NmFkbGRf1hf6e3CShelLvNjMZ9flmg7Sq1URA0qD4bs/MPQNUswiP79qES+AA5Lp1JAz1b7a2kw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 21:35:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 21:35:48 +0000
Message-ID: <6efd61b8-5822-4224-abf6-54d78b1957fb@nvidia.com>
Date: Wed, 31 Dec 2025 13:35:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-6-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-6-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 32eca3d6-f4ab-4b72-0ae4-08de48b48fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGtjR29MQjB3c1BhME12RGRKN20wQ2pFRmRtZ0V4ZlZvUjN1ODN5Y0tSbGxS?=
 =?utf-8?B?Uy9VSlBWTWJEZUNnd1BmSGNvTHU4L2ZYNWdXREtwL2g5dDRHUXJNVm55S0c1?=
 =?utf-8?B?MFl4QjhzMWdLNGhnOWMrVGlYdFhXc0QrZHA0QW5PdjZTN0I2YTVMdkQvTjZP?=
 =?utf-8?B?bWVVSEt0WU9vUkw4dmtwR1ZtMnlSanppaDViQnFaSWJpNG1wbjFBWkVJSURS?=
 =?utf-8?B?MkE0TXhmbVNsLy9EM254UDJia2VnUnpTM0NocldaV3RxZ2V0bnJBdWFyaG1t?=
 =?utf-8?B?bFdMZTNiRk5kbWJlK1lPTmdhMm81ei9XSDNLYjdtVWhCWW5GTyt1UjFIWElR?=
 =?utf-8?B?NkJ6RHZKRy82Y3dTQ3h3U0VkU0NRc0VWcHhoaXIxYk1oZVlwSWZ2VEZJVzd0?=
 =?utf-8?B?YVFWczJJaHBhZHFSUUJLYzkvaVIydlZjZTFsdnhyWllFTVhPcVhEQ2FhSVZj?=
 =?utf-8?B?V3dwYW4vUVVrb3N6M0pPTjlHbUpXMUxaNDZ2ajRzbWsyVHRjMkZJWHpIbEl6?=
 =?utf-8?B?WHpRRkJqN1dITU42TkZKSVR5THJnaGR5NzM4ZVFLeW81bHQ1MVFqVzFuNnQx?=
 =?utf-8?B?TTY1WFNXZWRxR1hvQUg4azhrb09MYXdFdTB0WlF3VUJEckllcTdFZ1pkWlFx?=
 =?utf-8?B?WCt3dmc2aG5yK3F3OVlvYUJRUStyM2pIbGY2MldIYnZTTTBIN3JIaUVZL1Bi?=
 =?utf-8?B?QmkyQllGRHJmbFFaTllvam0vbE00SXJCeVl6QmZZM1RzbVYyLytRWTJucmxs?=
 =?utf-8?B?aCswcDZrb2FYRVhBWGR2Qk11YzFibEdwaWdtTzdWdER4T2RXUVhIZWFCMW13?=
 =?utf-8?B?cTk5ZExVWkpZeHhLMTRzb1prQVdid2ErWk1OY2pRRkxadUx3TUhJbTVxeXhR?=
 =?utf-8?B?RTRxSVE3TUNtUVBsNnVXTHA2NU5BdTRuUk9WVkI0U08vUVdLc3dSRTk5c0Jo?=
 =?utf-8?B?MGdDOGRxOXMzVjI1ZG5NVUEyQ0l1MkkyWjFZSXFvN2lXK3Nxb3pnbHRiZnk5?=
 =?utf-8?B?SG1UVGpRYWliZ2cwZktPcGpsOTM4TG1hdFBHU0JFYVVQWGVUMjdvM2VSSnh1?=
 =?utf-8?B?RXJTdXd4WjduR21iNFdPVGlaVXVMdW84cU1aSnhaMVBCcGkyQWdPSUpyeDZ0?=
 =?utf-8?B?ai9ZaXlZNXBiQllBeC9QdHhnRm1vNy9ybXFDbTZoR1lxWmp3RXo2WHVpTzFQ?=
 =?utf-8?B?eU5yTDl3V0cwd0tFeGlZM2V3bWpXeWVCajhwOFJyaWhlYk0vSkQ4RHdxbnd6?=
 =?utf-8?B?NFFId3FDTkVDdHpDZkZWNDZRTjY0Vk1KVml0ZUVXTUhWYmFDQTV0RjM4UWRQ?=
 =?utf-8?B?V2VHNXhudDlHVVd0bVBlTXN4WVR0T3RpL01OdG5oYWM4NVNGQWs2cE1UdE9z?=
 =?utf-8?B?K1ZtclYrS3p6alZlRWJQTFJ1T1p4emJ1WlROZG1sT1dHZFZuQ1g2Zmh1NlVG?=
 =?utf-8?B?NWNtSEd5Qms2WDY5elVOdVVpOXl5NkNVUTV1NUx6QkpscHlLdy9WUzhVeFhk?=
 =?utf-8?B?T01sVHZoU3VRb1RaWUNac29oSGhKMmNiaUFrWVpMMUVkSFREcm5MZldzcEpB?=
 =?utf-8?B?d2tvTnNldTAyWXg2YWFqT1g3Vm1Pa3B0Mlk3TElPaWVtcHBEaHdHS0E5bnh2?=
 =?utf-8?B?SFJ1VXd6RHBmcndnVGV1MG9qQWptaFpGdFdYSlBJWXJMVnJ5TjZ6N2IzdEov?=
 =?utf-8?B?Wk0vZEtoRW42elY3N1JXTS9NZ0p2ZXlnVzBWS1NDaFVDRE1JditWVVp2TEsy?=
 =?utf-8?B?UzVGaXZOOTFIV0ViZ3RUNXBSTjJsNjZpQ3k2UStzTENQbys0M0N2alRSSUc1?=
 =?utf-8?B?bFhjcmdTd1FUUUZEU1RkRzNGMWsrTzl6ZnZsMFVEZlVOWWowRUFyR2kyczdK?=
 =?utf-8?B?OWpSOVVhVXBrR3oxZ0xKSVIzT0g4UmlYZEZFbnlXYi9iY29pRDV3M3I2M1dB?=
 =?utf-8?Q?A/Ww+RVlJyAWezoxV8+0tbSBJmNd+aAj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ODNlMzd6WjViUFYxOXJxNzBLK1h3am9vQWZLQnJJTjRGaGRJSTV5Rjh6KzBt?=
 =?utf-8?B?Unlyak03VnJQVUppSDBUQUo1SmxrNmtFeUFZaUcvRU1LazdwZG1FUnFHQ0dR?=
 =?utf-8?B?U1hSYXFKbjdieWh5QVpyVVg5T0M2RGNpTExON21vRytobzZ5SnczRUViZ1lj?=
 =?utf-8?B?RlVrWWNTaDhscktldVY4UytwQXhLTEcrYzN5Z0dlMlpFdTZtTkZMSEE3dVlR?=
 =?utf-8?B?QmZZS1JpU3UwUFZ2OTU4Q3NsRURZRGd1bnBOdHpUcXk1ekN2eDdqOVdRN0kw?=
 =?utf-8?B?TU9haDFHOFRyaTVncWIyNlI2VytGYTFxdHVVbFNLc0kzMmxKU2RCYlhYenVu?=
 =?utf-8?B?dGhocisvVG01bExiVFUxNnpRSW1zNnR1QW1VdkI5SE1OQ0tOMGdpM2w0QnA1?=
 =?utf-8?B?NjM5V2FlK01aQzRXdk9KdGJvNldBV0JYZEo1bmZxSjRFNHFZV2w5REhXVFVv?=
 =?utf-8?B?bXB1MjYvMS9QVHJFbG5xeEtmUzZKaVdRWFVLeENqMlV4d0lianYvRm9QaXo5?=
 =?utf-8?B?Zmdwd0hLVDZhbDB5SkU5bXJ4alVzeUxjTjduNktwcWptNFZZUnQ0c3FIUGs4?=
 =?utf-8?B?aEpuR2FYUXNvaExkdXkzWTlWZ0RhKzBPZXRPWllpejYvY0RFdTlycVM1UUtz?=
 =?utf-8?B?YXFWYm5iV2o1U0FROEx5V1hPcUpLMzQzRU42WC9hdjlrMUJUd01ndFI0a2Ny?=
 =?utf-8?B?WmIvenErY28za2pLMVJoNXVXV2tPMkJJVU1JcXEwS04vNk5yaE1mdEwza3lJ?=
 =?utf-8?B?VmMwQTBYaFhGNUNrSDhFcTVSZis1Q1RFZ2p1OGNZVUJ1TG9CSjIwK1p0c0dP?=
 =?utf-8?B?NkUrWVdiS1VlTVhMY1VyQTk1SElSTTAyTXFLRm82Tzk5bjFZdWx1dFh2R2pJ?=
 =?utf-8?B?dGZUZE9SYXdaeExqVnJIR25JVWR4WDRRQVM0N0hoaGJ0MlNpMC9GMlppSXZa?=
 =?utf-8?B?dlg2dWphaU1oZkd6YzA5WUVRck8rRG56Szc5bDdYK0RvdUdvVHRFcVdMUFFk?=
 =?utf-8?B?SFAyWEh6cFJBTGN2Q0VBditrNUlJVi9Rc0c1Ykh6R1FMT2FmY1owdDNMRHVr?=
 =?utf-8?B?N0FyaURvWTZydDRaR0RqVkFUNnZSb1RjSXFLTVRUbDU5SnRNcStOVW9NTzA5?=
 =?utf-8?B?WFI5RHE0RGE1Zlkya20rS1E1L2pqZkVXYkkzc3FjcTd6YzkwYkwvUk1tanBC?=
 =?utf-8?B?U1FYZGFUQ1VMQ1hLL2RtME93ZHgzeVBxL1IybktCM3FUaTJ6NFlKcTdMRE5i?=
 =?utf-8?B?VTdyWk5vN3JxVlUrMDJwMXBxd2xxa24vaHNiN1VFNFBWRVhmRGg3eFUxOUtW?=
 =?utf-8?B?ZVVZZ2tnQkt1V2tiQzJGdGlub0EyTUVFOTRIeGRNK0Rpck5XS3UrMGNCa2ow?=
 =?utf-8?B?dGRuVWhLMUhqaVVkU2RqQjdVQWdBOWFrRDRxakU0eVhhMy9IT1ZQR09pUi80?=
 =?utf-8?B?TExqV2FXb2UwUkVuVmpzSExtRmJ4dGdMSVlsNnlwOElOODF1SjdMajY0WWJi?=
 =?utf-8?B?bVVlU3FTWDdtU0pFQ3JJeW1uaVhaM1VHc2g4bmFteUtvcE5taGZzZ1BFdEFG?=
 =?utf-8?B?TFRDZFFCTkxTU2ViWkZNMXR1RDkwbVU3Tmp1YnNBNndoODVPSS8xdERLTysv?=
 =?utf-8?B?UFhyKzJXWERnK0xwMWl6c0Y2dTlTVFNYME02Z3pNRVRVZ283RTJXRVdNZFgy?=
 =?utf-8?B?QVI3RTNmaEQrRTVuanZmY0VsQ001R1MxRWlvUGtnMms5UWl5cmhtZW5IYU5j?=
 =?utf-8?B?QVdtV2MyenA0ellEd1ZTbEtsZUtRUElwQjcweHYrNDdaLzdPVE0zNWh3bTZO?=
 =?utf-8?B?c09sZnJzeFJsbGw2TVVtS2MzZ0NCKzR6ay9TaVRITDlaN2RzMlViZ2NYRHRP?=
 =?utf-8?B?SWdaaVN3NnAyc2hVMTNrTnc0elowdTB1Mmx2dldURVI5WEcvSk5WRmJpanZI?=
 =?utf-8?B?TkJ4SXpNb2l2bzVsdWRTNzhERnc4dC8wV0tseUtnSHN4djUwaUZqSjByMDhs?=
 =?utf-8?B?bkMyUzZ0VVBuWnlUWDdJZUU3OVF2dXkrNk44WmM2Z0xOcnkzNFY0SWtsZzNO?=
 =?utf-8?B?NFdlRXZkUnZ2K1VJeVQ5SWZYcXlDaDVjOEEyRC9KNGZucit6VUNMQ2lITDFY?=
 =?utf-8?B?T1RRL1lyam5Qc1lYcTN6RWpTbU9yNmR5Q3l6MU9Cd3p6ZHI5Sm9JQXp6aFl6?=
 =?utf-8?B?NXFsTE1SbU8rdmZCcEF1YzgvTlhydjZiVUYyM2x1MkdYQURQSHBwTzd2c0tU?=
 =?utf-8?B?RXJDRWlOemp5WWZyOU5FbU43Z0xLdjMvOWdYZXF6SDFxdTBQdTB0aVZDeDd5?=
 =?utf-8?B?MHF0cVRnRU9VV3NPVWVqd2k3aGU2WEpJa1dEa0xnSysyd3FyQnVwZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32eca3d6-f4ab-4b72-0ae4-08de48b48fd4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 21:35:47.9240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CdquhqPS+wMH0JCh8OQJjjJQc1F6m3yTBhHSMiN2XHeNBVn98iq9UpDV0m1DPyga5qprvboPQEKWxY5HjdpUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
Message-ID-Hash: OJ4BN4APDIK6VESVEJWTVET724LWVB5W
X-Message-ID-Hash: OJ4BN4APDIK6VESVEJWTVET724LWVB5W
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OJ4BN4APDIK6VESVEJWTVET724LWVB5W/>
Archived-At: 
 <https://lore.freedesktop.org/6efd61b8-5822-4224-abf6-54d78b1957fb@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/17/25 7:29 PM, Timur Tabi wrote:
> The with_falcon_mem() method initializes the 'imem' and 'sec' fields of
> the NV_PFALCON_FALCON_DMATRFCMD register based on the value of
> the FalconMem type.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 16 ++++------------
>  drivers/gpu/nova-core/regs.rs   |  9 +++++++++
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index b92152277d00..44a1a531a361 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -454,7 +454,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>          fw: &F,
>          target_mem: FalconMem,
>          load_offsets: FalconLoadTarget,
> -        sec: bool,
>      ) -> Result {
>          const DMA_LEN: u32 = 256;
>  
> @@ -516,8 +515,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>  
>          let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
>              .set_size(DmaTrfCmdSize::Size256B)
> -            .set_imem(target_mem != FalconMem::Dmem)
> -            .set_sec(if sec { 1 } else { 0 });
> +            .with_falcon_mem(target_mem);
>  
>          for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
>              // Perform a transfer of size `DMA_LEN`.
> @@ -551,21 +549,15 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
>                  .set_mem_type(FalconFbifMemType::Physical)
>          });
>  
> -        self.dma_wr(
> -            bar,
> -            fw,
> -            FalconMem::ImemSecure,
> -            fw.imem_sec_load_params(),
> -            true,
> -        )?;
> -        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
> +        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
> +        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
>  
>          if let Some(nmem) = fw.imem_ns_load_params() {
>              // This code should never actual get executed, because the Non-Secure
>              // section only exists on firmware used by Turing and GA100, and
>              // those platforms do not use DMA.  But we include this code for
>              // consistency.
> -            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem, false)?;
> +            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem)?;
>          }
>  
>          self.hal.program_brom(self, bar, &fw.brom_params())?;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 82cc6c0790e5..c049f5aaf2f2 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -16,6 +16,7 @@
>          FalconCoreRevSubversion,
>          FalconFbifMemType,
>          FalconFbifTarget,
> +        FalconMem,
>          FalconModSelAlgo,
>          FalconSecurityModel,
>          PFalcon2Base,
> @@ -325,6 +326,14 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      16:16   set_dmtag as u8;
>  });
>  
> +impl NV_PFALCON_FALCON_DMATRFCMD {
> +    /// Programs the 'imem' and 'sec' fields for the given FalconMem
> +    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
> +        self.set_imem(mem != FalconMem::Dmem)
> +            .set_sec(if mem == FalconMem::ImemSecure { 1 } else { 0 })

I went down a deep rabbit hole trying to understand why these methods
are chained, even though setting is infallible. And I found a major
API design choice that I passionately disagree with, in bitfield!(),
so I'm posting a separate patch to "fix" it. ha. :)

Anyway, this is all fine here, so:


Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard



> +    }
> +}
> +
>  register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
>      31:0    offs as u32;
>  });


