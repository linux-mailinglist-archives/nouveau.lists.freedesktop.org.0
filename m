Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE83C6D029
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9385010E584;
	Wed, 19 Nov 2025 07:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Krcsl24T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012018.outbound.protection.outlook.com
 [40.93.195.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C3510E584;
 Wed, 19 Nov 2025 07:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gK3t+giqlwZTVpRit8fSgrMyKM80sysigzerU3hU3Y1NuhIcfEHDxMZdlG6Gf8ORoW+jfRLq1YIwAC6H6UpCKQvpbck6z/xabL9o7fipCyl0By5/+7kkeD6/0iiZxpJEninvgSi3ALIDq4Ot1+XftpHpg8gB+fM3EzakllbwIQcQ//si0hFBQavCShG+ePOBs4bWFT0V2IkfE8GYmjwX/SDoBYekeBaSV3MdckOpHIbKWFZ03LFgnRzzh63EJhGZmlLrVXaUpGrvo+YlptgwQoqwdiSMlAw/RyfJVBVqGxhCpi10StcPNEqpj8qCG7AnAx68XqGcKm55n8NU5OtWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJR/IPuyXV0fgagOKWKSnvYw1bjk5HFVvDVbjxY9JHY=;
 b=w0hO0XiiWtISaR+1QddXO0lOrvQyvj9+6CVD5Lfap3TO96sbbxXoKojMtkQf8el20hh909PpGn/UobJ+XMltWbi2X0BP0r07nN/oCRMI1vW1wGDVK7j+8qcdJYQhSnfOefK2lS/4i72shxqPMYy+/7o2oU3mPGiPA8Nh3Sh6gGoR7wk2Hwot1T9qaMVYO/R9b1gI6I8P2tpSr3Jo8QsLw5Exm4JqxxZnRmJn+rIqaoORrs+wclV2LyWxISlzzuVQhb9wE/BkmejKSSmFbf2+RkmmyIdlOAzuqXtI5IX8y2LfPhJ5uhgFwRv/2QSKsd3M3z0OHyAu3hB6YX0LQ3NOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJR/IPuyXV0fgagOKWKSnvYw1bjk5HFVvDVbjxY9JHY=;
 b=Krcsl24TxSCqnygjIi0UoCwGpwRDOdEmNDkS/2eTacmBK+ctfGi8qY0sWSAfiPBRDxS4PYH29GMxE8jbS0pkAoYbIkF/WAXCUJoPXF/gnFMdH/4ScPBpaL/5NfWVNQRXiLtH8BPur1xuTSaXemUbJ3kZM45JrpfHH1ly1MgRsk4a7i3yq7I1+BBfBuRQRJvacC2twA4S0W2bEDTJpkO5CUZsc7Kai3NlK20D131VEXR3JXj2h0S/dv5FLiuCBbYUjaqDDx3d/t/I9ZNbGynKo33KwIs7K0D2FRVEEIW+uItgYg1YYJxQOlFUr7vzTeD3qx6+Lem8zR2k4XSzRSquhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:01:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:01:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:01:12 +0900
Message-Id: <DECH7ZJDOVV6.1IDTRZSN69WT5@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 11/11] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-12-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-12-ttabi@nvidia.com>
X-ClientProxiedBy: TYXPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:403:a::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 9736ab74-4700-4e0c-5b06-08de27396e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L00vQ2JPdVlhdkxUaVJXMEFSOEthL21tNUtHM3NmandWaHk1TEw0d2dwaTVN?=
 =?utf-8?B?MVdYcTMvVk5oQm1Pbk55bmRhajdRb1VYMVlwSG9jaFBGcXVMVWF4ZXA2bExP?=
 =?utf-8?B?aFZyOXZiWVBEMmp0aWtQckhPNkdGWUVjVitZNEw1b1RUeGdueFVHc0lvSzVs?=
 =?utf-8?B?RGNsb1Urc2xPRGVJYjl6RGhQd1pReVNzZnhYWHQxTERrWEk0Z2Q4RWVuRHAr?=
 =?utf-8?B?L0tWSFpYZmxEUXRRdEd0UW5jRXpKRXVpUTU1S2Z1dFhwdHJYeDEyUG9hTlhu?=
 =?utf-8?B?TVR3SzZUSjdKOWlueG1RNk1iRDlJZFVxRHBnem40RFkxUGVObkpDL05SUElL?=
 =?utf-8?B?S3hNbTd4eDZXTWNmUkJCbEt3aTFMVkMrUEN0QnpxTVYrdGlTQmVsbVNzTzVs?=
 =?utf-8?B?RC9POEpRc0xPME5qQzFOK3BBUjFPaEJIMGhJQjBpcnUrUUFCWkUwTmN3dWxN?=
 =?utf-8?B?eCtqVXlrMzdST1htL241b3JoOWRZTE5RVlcyM3RtWHViemlsM0doMCtRMWNN?=
 =?utf-8?B?aTFSSGhwamZLbmU4cWdjdGVKVUtzcVpkME16VEM5cUFjNTlyTkZBVGFockh1?=
 =?utf-8?B?TFBoZnFQWFFaQzZlbEUxNHpxUW5STHJYV0VUNjFmYjdjNWFuaWxyZHA1NzRt?=
 =?utf-8?B?QUpEVEpKcjAxSUNVblFZY213TjZXVlJYQTZLQlFsS2R0NlpnOWszMVJ1ZHBt?=
 =?utf-8?B?RmgvaDc1Z1dXV3cxa29CRW5DM0U1WHFWMi82dnBpalBsT1JlN2x3TmRyUDhL?=
 =?utf-8?B?M1hUVzltbHJtdE03Q1pzTzJuZHFMRW5XSnlKL0M5NlRhalMzSFYrVy9rZlBi?=
 =?utf-8?B?SUVBRVA4cXRRQk9vZHh2N1J3Mm1haytxNHZRaGZDVXFoL1E1YlJBZ05RYmpL?=
 =?utf-8?B?d3NWanIyYVpydkJUVnQxa2hSK29OQzY4dFR1ektOVGhmbGNzdEdIZHZDMElM?=
 =?utf-8?B?NG1qTXloOEtnNHhXaDJmYjJLNzd1VDJSek1ZRW5iSUFDRThuNDBzeHlmWko3?=
 =?utf-8?B?aU9zaUdCQ3EzeFVmeTQ4dCtTcGwzVWUrRm9rWHdvNTVtdVFnUFFMejlVY0Z1?=
 =?utf-8?B?UXVzckxmOFhFdEVwYno2ZVI4Y3dGcWJYYlFFSUJLVVRtWDBYam0vSkVLOS9X?=
 =?utf-8?B?NUpRY2tSSkpoSGRhUlBNMHlEZzh5eGt1NlkxWW54L1lNUGYxVmVtVE84Uzg3?=
 =?utf-8?B?bHVRQlZxdTdRSjFqSVJjNm5ZVVI3T1NBOE9IcFc0cStaaC9zRE52MVptWDdx?=
 =?utf-8?B?ZlU3eDJxeExvY0J1djQ3RWNCalhSMTlldlBsYTdyeGVVVEVpdUpSbGdHNmF2?=
 =?utf-8?B?UE5HcGpyemJrMFE1OEpFelhnZGJYL1lla3h1VnBGOENBbkVuZzZiQWM5WExy?=
 =?utf-8?B?SWNRVzFiT0NkbXBXMlcyQmNBTjJZbEhYNUhBWjRpa3V3S3FiVWhVSStBcmlZ?=
 =?utf-8?B?K1RLV3J1ay9FZjNOaUFEWFRUOThxVUF3YlVUUXRwSVhuT1lKRElRTmVnVjRt?=
 =?utf-8?B?aFFjbDlTMUlibXdOdGNaT2JteGdLZjN6a1ZUTEFVTXRqTkV0SFNqaWJIdG51?=
 =?utf-8?B?Wkx6cEhjUThTUnhhWGIrQ3RDNjZ1MGtieldOcTU5eE83bUcrWThyVXdlYm5n?=
 =?utf-8?B?TGxhbG1sTXRSVmYzdUNZcFJkU3lpWXNOUkVEbVYzdWl3V1JaenJseEhHRGhE?=
 =?utf-8?B?MVNtWEhna1BRQTZ0VHdEUGQ0ZlNQZ214ZHF5OGhkRG9nSHdhYmYrQWlsK1Bl?=
 =?utf-8?B?U3p4cU1yRWNNSTJvWGdrQTJaa3M3cW9wcjhURHVuNE1GM1RheXlHak9Za1ZT?=
 =?utf-8?B?SFFUZElNQ08wdzFOMGk1WHQ3SkRhS0RwZllHV2ZYS0ZmemdjZlNUYVg1dlNX?=
 =?utf-8?B?bUx1M1k1THZHbmpNU2toTDRCcjZpOU1rR3gxQ3dienBCRE5ZL1BWbGIxSzJE?=
 =?utf-8?Q?IADpeZtRYSdoKEVg48AR4DKIenvHBQQ0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJOSlp6N0JCS2IzVmJMSkh5WkFxcXkyZlROWkpxK2VvQzlPWHJWZGJMVGNm?=
 =?utf-8?B?Z1V0azlSN2dIUG1GeTBFWEhoL2U4Umx4V0dyRXltQkNCbHRJVkdObitkbGJC?=
 =?utf-8?B?Tm9kK2hHT1hKOVVTQ25FdDh4SmJDQVNIZE1nU3ZzbGV6Uk9zek1LV3F1MGZE?=
 =?utf-8?B?MEdnWW0zeW01dHcxKzdrZE1EcjF3TEZFNUdlczEyc2VDMk1Wb045NGZOS2JB?=
 =?utf-8?B?TThDZndPa1BUN25QRWtBMjYwSGpjbXJVdmEzVFN6WmxSRGptdTVnQnpDckF1?=
 =?utf-8?B?Nm94N3U0RVMvZEUvbUlkVmQ0RzNtQWJYZkZYZk53amxqcDIxVWhJZUtEWWZK?=
 =?utf-8?B?cUhFUE1JekZIaDllNWFrNDM5TVlIU0swcnJsZTNBMThTRWR5MlFCVkhEdDFZ?=
 =?utf-8?B?MVdVOVZ2QUx1ZkhYa1JCZDEwV0I2WmRwbEZHYmM5Rzg5bTVNMUR5ckhEUE80?=
 =?utf-8?B?RFBOS3lyZzVuS1lubjNsREVFMDh3Y1dYWFZ5WU5GZUlMd0YvaFlwYWdnQ1ps?=
 =?utf-8?B?NTdLc0NTa1NKbThscUFub1lZSjcvUkFKRGdJRE9yY3JobCtDa1d3OEhJZzNm?=
 =?utf-8?B?SHdkQ1dnb1VjaXRSKzVDRzNTc2MvZE5jd0dqM3NwazVWS0lSZ0swZVBSMVk4?=
 =?utf-8?B?UEdEYXVnZFhsQllZRXA5OFpiNGV4S2dPUFJOWWNNNHJzRjZhdUNubm9JRE1W?=
 =?utf-8?B?aGVsT1Zib09sRkt2UWhQeUZxVWVxZUNFNFdmQjNJRVVYWFg0QkdaWjVob2Z3?=
 =?utf-8?B?ck5reDIvTlZ5RC90UEZ6YjJyNFBld1ZyOUl5UmhHUXhUY2xpK0lzR0JNMnhJ?=
 =?utf-8?B?MWpaUis1eXR4Smt5N1Y3bWlyenNCck5FVlZMN3lnZnpWWlJnSzlEbytDaXhw?=
 =?utf-8?B?eWFPT1hhalprOUxrWExRaXpGaVhyU1ZuOUF6T0F4WjB6bVJ5S2hmT3N0R2Q5?=
 =?utf-8?B?dUYyNE9zRWpvblZoeVRncHJKa0VVRDR6VXZ0Z0Q5Yk9YaEI0aUgxN3RVMlVE?=
 =?utf-8?B?Q0EzTnI1NFN1ZVN5U09DOGwwSTJGdnZwSE5aOGJxTmpRcERvVXY0d2VXN3Fh?=
 =?utf-8?B?NGRCdTNYTWFWWTlMSWhRQm5ya0xMRTl2UXZhTDV4cmhFcnhFbkxDSEVrTlh2?=
 =?utf-8?B?SzBRTHhRWWhGK1RTcjVuK3FwQWtPd09LSEdjVTRJN0FiNGZNT3gyVS9MWE10?=
 =?utf-8?B?OGw1b01iV0NPZ1BNZkZxL2JXN1BaVEhBRm1PYVpWUXdJSXVoSzdISjUxTGw2?=
 =?utf-8?B?WEpDYkJQWXpzK3k1SXR5TUxEOHczZGQyOGJRbEVpaTB2K3VZNGpMWXJTQitX?=
 =?utf-8?B?L29jZjBTRlFqNkZ3YVFONlZObFFzU1l3SFVqUmJWMUJLSCszSDBxWW1Wbi96?=
 =?utf-8?B?K2ZKdkZpT2YyMWNOWVJYSmcyaUdybmtnSjVsb1JLd2huK3l1Q3lBSHVYRjg0?=
 =?utf-8?B?UTF6WmVEYkZhT0tQWVYzVnVMSHhNWHU1eWZxSGJkYUhzVGVuS0t2Y3NEUnZY?=
 =?utf-8?B?S1FuRkEvNmJ5cEdqOGs3THk1d0svcmpFeG5MMDVSSm42eFhXZHpWTDAwQm9y?=
 =?utf-8?B?VUhaRFBQRm5TQ3d2akVVMFlyTFpsQ0dQVnFUeEFEK29sVkZFbzQ0dUM2YWwr?=
 =?utf-8?B?K05vNTBIei9xOGVIMVd0OHpEQXlSRTM3MzljY2N3a1Voc1FEY0NyWEREdHdP?=
 =?utf-8?B?TmhEYWlXZXJwR3FiWnV2Yk9NNldoeVFzditFRkhRU2lmSm9Wa2RXRHh2L05P?=
 =?utf-8?B?SytCdHNvNTFxYkhOK3dSeGxqcmZlNFltTmxhdTVSNTJ1dnpWdGlsMHdmMmNC?=
 =?utf-8?B?UFRxNkJmTjJuaFE0MitCMHhPaXVUVDFLakF5N0REbTZ0VUdXTjJYSlRKS1R5?=
 =?utf-8?B?aTBGd3NqME45Z0VoMXJhejZwZjRlb1JkODVnU1ZCWEpCVlFsTjk2SFVXdW1O?=
 =?utf-8?B?ZXBRSk9ldVJkOVcwVEltN0JZVWtna1diOHVYWklRUVJuMDcvWFd3c3k3V2pL?=
 =?utf-8?B?Um52Qkd1V2g3S2taQ3ozdXNINmpTVGVMbjJLMlBsSHl6OVFic2lVQm1TUTVU?=
 =?utf-8?B?MXNpcXB0ZmxXd3ZNQ3loaTUza1FqcHEvL080SnVZTi9SR1FiSHFwb25ETklx?=
 =?utf-8?B?b1UrZEZUNi8wOElwd3lZRWJMcXZaaHVTS1Z4QU1DaGo1MjZROHB1U3lubmg4?=
 =?utf-8?Q?eWiXyvl3n9HYxpIrgFMW42RSfDvoF8C0aeaPoZhNIque?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9736ab74-4700-4e0c-5b06-08de27396e5c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:01:15.2759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6p4sFCQzoej1fRS1krbOQcZ6bN1DHdtCUD5ycnhPUxsremEPvSjnlczbumwSCSftSFtAvnFebSIasQF9jwXyAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929
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

On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
<snip>
> @@ -182,7 +184,11 @@ pub(crate) fn boot(
>          );
> =20
>          sec2_falcon.reset(bar)?;
> -        sec2_falcon.dma_load(bar, &booter_loader)?;
> +        if chipset > Chipset::GA100 {
> +            sec2_falcon.dma_load(bar, &booter_loader)?;
> +        } else {
> +            sec2_falcon.pio_load(bar, &booter_loader, None)?;
> +        }
>          let wpr_handle =3D wpr_meta.dma_handle();
>          let (mbox0, mbox1) =3D sec2_falcon.boot(
>              bar,

Ah, one more thing: if the loading method is only dependent on the
chipset version, we should probably make it part of the HAL.
