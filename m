Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD2CBB43B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 22:49:57 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2F910E479;
	Sat, 13 Dec 2025 21:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KE8o+goF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 188C8451AD;
	Sat, 13 Dec 2025 21:42:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765662153;
 b=suwIc3I1hyYQAQhDAbvKQrNn4nkE8U6esh2PuLZCOpioUfBZDgR5u/d56wYyD8cuVUgod
 CZA+vbSbkK2JCrWUX3hstFyEOhOJV9TEeGzLwThAtk/dJHHG6TZa3yuU/dRgegEV0Hq87sB
 3aVI+N6f+I1sDAcckkk6Xgw2PgnEPGuz1cXgaEXKobgkXiyaz/GEnOCZ1LII3Xt6bkSDpdi
 ePh7NzoBfsITbX5XO/qZVc+ePSUI4qQsgDyGZNcKh12gdd3ubqXKnnkXrSFoXEN/907j+Sz
 wjLm0+DenCdcDimb9jNwsCScAV4q0KUm0aJGIG2VWSsvIw0b0T5DfHCeXvmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765662153; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HX9FiKyeWcgBkYtwaZFE1s9Z8jxtCeX1F8fht9DpYxg=;
 b=CK8v2SFTedHUuGvEbKGOPyvaiBKEdjadk0wXtt4kfL7C7cBQQHJU0bip7V2BTPkvZMBOY
 Ni1htE2tiC0Nghpsf6My60BblAoiM6oliwvUftDtJlf6AbXC/IPzclRn7NIlz1piNJxAiGu
 mEU2793IXsVZF9iBs100rJZA2PaKry+p+hlU8lcw3ZYcYmuy2jf4KKtjGnOh6T/sJkaK0Gb
 eMgR8FU/VNXBfIxXlZH4GgeN+94ebltoDIDU03EGKHWPaRY1VxHf8S1H2x+rxfvqq6cp7bH
 PwbU7uAid9hoNac+kwYMWfQp70Sqjie4IGVXqQ57/sCkNd4ZOwkr5Ny2DQaA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 06AEE4519A
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 21:42:31 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011047.outbound.protection.outlook.com
 [40.93.194.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8510E01F
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 21:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biR7Y3sR3oWtYL8+PdaOVdtpofr3/DMhkTj3X4hLdGyfJccmvAwadkJghTJtb0IvFMP33o4AyrK4qcREJQjeoUVYfq7epiintddlelytrMJ+QbmJXk2P34mgJlKJBRVUc4+z3sZPbHRgUlko5ipFNocA7nfqfzSg4HRu4HUMlaaa0njcMxD1er6ahHVxJSU/veLytlDQGVRhHkREMvtWxSRR44vAWtkoh6BLIeZBLIaA943/SZO8QKYEvS8nb/jVlbltTFPi50d/4cR2AmSpG41C+epxbm9/qE3Hy6cwrxtZ0KAIdOK41PJSVXBdGm7zkUrjABnmyh0WvPTiEo4PuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HX9FiKyeWcgBkYtwaZFE1s9Z8jxtCeX1F8fht9DpYxg=;
 b=cHObIiGREAk6d4Blpu0+WxsRyd6I/cN1SG4GLVbQWaw+HMZ+Wz6IGwJeKAJYvXCsP/Pc1WQEWx6+VkU15pb49Oe3i69Mu2Xj38CU20AkIKbKtqlm+MSWTKk2ajuA8rsDBk11ubT+2zo+Y31MHQ9Us3dexV9/pGwGtE0Z2BRvAy9pfnd9OWMRwOiOLRRP+sgvXjqyzk75UVB0ni2h6M8EohrdfgV/EZ/c1ps05liK7OVA0JfBrTeA8eldW8oGEIvwVaCgYmX/ePWqoBgelmZEOPdBYGg0cNhJ3PCXr3E8wi1ynreyAgJ2gne6saBrFHoOHjODU62NjlqGVDmVEO96Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX9FiKyeWcgBkYtwaZFE1s9Z8jxtCeX1F8fht9DpYxg=;
 b=KE8o+goFeXcD+ye5Vbh3BkV6NIpZewQCmMZ0LOhD5pBjDusTu7mVvqGj5PBOveFBdRJfIyEuLIWVE8UvPSWCh+kMDdpMFegconyCRy4LZ1vbQrUaU7Ia/yjCWL83X2y7L7p+UiZiHWtXFRn6R0YxFZYwhVFYLyE3BcleD1MlT0ZJ4xSrOmQ4I12coSL735Sij4blBQPG81NOORbgw3cPZcjefyHvMGdQqZ5K0S/kblOE4XzN1cswr58DZrrdeuWd1HzvlJ3da9/9EkwpOrEqL7fO7S9MCQZM/jamMyygYVrjEklMr2yjKOU1uXc3VzYrKoZDYcksf1BRw1p4CFkIEg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV2PR12MB999074.namprd12.prod.outlook.com (2603:10b6:408:351::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sat, 13 Dec
 2025 21:49:48 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 21:49:47 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Topic: [PATCH 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Index: AQHca6ju44jH81ceSE6wxcToJM4SIbUf811egAAYnACAABGC2w==
Date: Sat, 13 Dec 2025 21:49:47 +0000
Message-ID: <85F0720F-116F-478A-B598-D197F3032DC4@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <A398B50B-0D35-4DE4-B6FF-E434608C401A@nvidia.com>
 <9d811a1cb846fb1cddbdc8c037587bec2cd296cb.camel@nvidia.com>
In-Reply-To: <9d811a1cb846fb1cddbdc8c037587bec2cd296cb.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|LV2PR12MB999074:EE_
x-ms-office365-filtering-correlation-id: 06fe043e-9489-4746-d85b-08de3a918928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eENBRWR2YmZMMTlzaEZxckFXZDlnbHhuTFBWUEpCQ2dwMFdkVkFLZFFXazNO?=
 =?utf-8?B?bGE1ZVN0dk9CMVVjTzNXVjFFc2o5T2U1bjVEcXBYMUJVbUZGMG9zMVZyRWlT?=
 =?utf-8?B?ZFdac0hHOFF5UFltb1g4dnZBUElFRjlFRWFvVHdCOHBTZUxISTd0dmpkcUt0?=
 =?utf-8?B?ZjdBUVNLUnFnL2dQSnNKUGp2SXVHbUVDKzJ3cFRDMU02MHk0VUZWcmRaaGsy?=
 =?utf-8?B?TWU1R0ZVaG40aEhVKzNZNnh3ek05RW1OMklVRzJpcjVDYStmeFY5azFzNGZI?=
 =?utf-8?B?V1MwYWFoK1Y1aS9HWWlHR3NFQXpGU05jWU9DVURFbG5WMm4xTldyMUVObnRG?=
 =?utf-8?B?cUtxaEQyOWlKL3JoYXllQjhUQnd2VkkwZENWMW9zR3ZCeWNDU2Zma1crMHE3?=
 =?utf-8?B?Y2RJRk9TVFFtcmR2VENacEx5cGZuMDdUS1J2anErUmdHdVlmWFAyWXlNRlpp?=
 =?utf-8?B?QTlncUJkYmx0YWhnUEQ2YlNDeVRFbjdBZSt5bjAvc3VKY29kVnVTYWwrVDVG?=
 =?utf-8?B?aW02VjZRRitlcTY0Ti9zSVR3akovdFN5MFhmVzNDaEltTmJSR0wxM1NkZmRN?=
 =?utf-8?B?SXVKdnhETzVWL1EvemdLV3RCeEdEeTlWWUdZWmxCeFZNQmduS0p1U1J0M0VL?=
 =?utf-8?B?SllwdFZEUUZ3d3U4S0xDQzN1STZLblF4N2pRTEExdDBTcWYrRExucjhZMGg2?=
 =?utf-8?B?ZGJqUkV1RTBVK2hwdDZrd01tVnNPMTl6d01YWDdDYWM0bTRiMSsyOHltSjJ4?=
 =?utf-8?B?cDhLdFZROFUvVXU5VUM4bXpmd2d1OUM5Yjd1dlN0ZzlIemZTMm54amw2akIy?=
 =?utf-8?B?am9CdEltU0NXZnhiMmJ3bjBBYURYUi80Qy8zVUxGREJiUmxIemVlSGJJdUUw?=
 =?utf-8?B?NXI3KzgwbW1ZcmdLaHI4TTNVdXNtWUYrbTNWSitKV2MzMzBYa01OaElHRTVM?=
 =?utf-8?B?bkJjUWFyU3poNmU3YUNmaEZuMVdGU3NMSDlnU3prRkYyUGN3bk41dktiVi90?=
 =?utf-8?B?WERPbGZULzV5cGJWeXpwb2NSTHE5dHNNR1dITit2amtzekw1cHNhcjBjKzh1?=
 =?utf-8?B?NjlUZzM2bHZWRDlxNlhZdkhGUnhFcHJGVVcwMExUYUtzZlJvc3VsQ1lKUXls?=
 =?utf-8?B?bVErUElwNll5Y3hJaWZzL1NOQlRMZGw4bE81Yzh0NGk4ZWxoSFdpc2RtK3JR?=
 =?utf-8?B?RExaeWNBUEk4V2s0dHJKRTJtNUs2ZWkxOUZaOC9XV0R4L3NyY2wxTlJxVVNh?=
 =?utf-8?B?RXFFbEJaa0RtWm1ER2p0Vm5wS2lFU2F6UnkxOEExbVNCUnhSRTNUb1hQcHZk?=
 =?utf-8?B?YXJiaGd2RThHamdTdDdnZEI3TkFWbDNRdmxmRWZKWDJtUlJidTJSbVBXdFNL?=
 =?utf-8?B?SGpwcUtNYmtzbVVvd1pyWVRlNWdCVFplb2FoaFpUamM2ZWQ0SnZCMTZoL3ZT?=
 =?utf-8?B?QjdnZVMzcUpHNE5Bck5MUVdDbm1idmZvWENOQU1qbnVwZyt6NlFDc01tWnh5?=
 =?utf-8?B?VFdwUVYwNm9BdzBWMUlMWll2VEN2S3NYZW5uZVZyRkVkSFlvM2t2ODIwajdK?=
 =?utf-8?B?bWw1eGNxTGdPNENVUVJ5S1Fla3QyUEFXZ3c5QnZjM2twRXVxRURaSE02NE1l?=
 =?utf-8?B?UU1USFZva0REWkZDYkUwNnMvUU5wMm91NlozSUsydFhnU21EZGRGSHRQNW42?=
 =?utf-8?B?WkprVmd3OVVidXRSSk1RUWRzM1RvSEpKK0J6YUwzbHFobmE5UW1jUml2RHZn?=
 =?utf-8?B?YXZDZlJXMUxKblhPdVJJOVpFMlhSODRNdXo5QjlHNnpqbGhYalFDakRzbm1C?=
 =?utf-8?B?VnoweTdyTm1BRUxzczNNaHNycUF5LzY0Rm80NHdJdTdSMkcrM1Ixc0RjS1lX?=
 =?utf-8?B?WlJmaTdhbnZhNEM0aXBKR3Z3ZGM0eWdRcU1NUVNCVkUyT3VqRzNRSUdHS2tk?=
 =?utf-8?B?d21rd1hScDJrditRdmlBa0cydFVwczM0L0Q0RERUa1RMa0t1amhOcjFWSVk2?=
 =?utf-8?B?dzFGcXpFMEdyem9CcnNocktFT3Evd2tCVWZmZmNvcmIwa1oyc096T2RuZTBt?=
 =?utf-8?Q?hZc2aT?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OW9odVkrWEk1NzY4dnlSOGRHVGxJVExSaTJwaGpFM2lyRjRORFdvM1lvUTU0?=
 =?utf-8?B?TFdVTE5nb0p1RCtUUk5NazN2U0l4ZkdRNkVMS0p6SWlNSkxqM012YkZEQktV?=
 =?utf-8?B?YmdqZEhZYXJ5VnVpMjVsT1QvWWVTQ3dKUkxyWkJBWmlsL0RTVjJidGVRNEJC?=
 =?utf-8?B?bHpsTDBpRzcxWmhEb0pheTQxRVFmV1BuSkRIQmVhcXR5enpPb1RIK0JYanM1?=
 =?utf-8?B?cVc1bmsrbm00SlRNM3RjcitPdnl1NFVJR1ZmbWc2Y0NGbUFYK3dkZ0piLzIy?=
 =?utf-8?B?U1dIUDhUY0g5a2R1c3RmL3ZUZDdxaENnUUg4c1FWMGJTeXFhak5mWmZ0OUlz?=
 =?utf-8?B?T2ZldGFJbFBNQ254K1pSN1BoVkdidytySTQ1WW81QUhKS2lVYUMzUFl1QVFU?=
 =?utf-8?B?a01acCtRMDZheThQZzZ6ODZ2YVJsbExod09nQitIeERqUjZHczhhelBxY1dJ?=
 =?utf-8?B?Zm83S3NOcVZXbFEyWTdtZXlENkRhd1VwY0hiVWRXbllMb2RGdkdjU0JoUWt5?=
 =?utf-8?B?eDArNHlzeEY3aUtrdTF6anJYUFJ2aDliclFUNTJ6K2czZThQWlFBY3ZkWXdE?=
 =?utf-8?B?YTVjWTJHY1U4c2FFR1hFZTJyWVUyRkJENEJ3Tk56MWhLZ01xb25nV3R1RmZq?=
 =?utf-8?B?ZmZpbjZscHBGZDhJNndGbVRXOGduZG1qN1pScFYzbWh5bkEybndYNElYRW1K?=
 =?utf-8?B?VHFGT2dHanZjUitKUmNnbzBYZzZJWUt0ZURzWC9icWpoaDFUUDMrTTlrdjNU?=
 =?utf-8?B?RFNjc1lpRDE0ZnF0M3FhNmlpOTBQWnlTNFZPRzdHbkFXNGtSczMwa1FzaU4z?=
 =?utf-8?B?TXE0N3hGR1lIRGxna0pkOUc1R0Y4TmovWDArWS9HTEFyVWpsOG5ITm9oQVd2?=
 =?utf-8?B?cTY3eTR0QkI1Q1RzaGVmS29HV2RkRndrcVJxMFRyUGV0elJMNVBkMjhSOFZI?=
 =?utf-8?B?RkdIbkxYZHBtZTNPZnZBZlJDaHc0RmMzZnFoR2N6NlkrOUsrTXBuU011UEJw?=
 =?utf-8?B?eUN5andOZ213bms1RkRRY2lGZnIzOEwwVytYcndSVmNVcDZXR2dnYWhDaXJX?=
 =?utf-8?B?SkU4ZW1aUmhiaGVHYmJJNERoRWE3TWFvUzVWMjVncU0xdFV0Szk1eGdyWnk5?=
 =?utf-8?B?Ny9JbFRicVNjRkx1Wk5MYlB3WHQxNjFJLytRTWFXSnRMc3J2ZXVZOVl0Z0Uv?=
 =?utf-8?B?aGVjQTBadWpuei9QVTlzNUQ2cFZ0NjB2N0JZMjVqQVgwakhtN1pIWTNLWTdN?=
 =?utf-8?B?WGs0MnU1N0hoWXdBd3R0S1BXZVQxaDFCR0o3R1NTT3ZhVWRTU3dTMUFPYjdE?=
 =?utf-8?B?Y1pLcXRvTzdCTHFhZVM0RXVEeFZreTdhajlSL010Ly9HWjBFK1ZyaXRrTWM1?=
 =?utf-8?B?b09vdDZhR0N5dFFMUHN0SDRDa2t3bktvQW52NWJMTDM0dTl4b0ZuWE5rVUs5?=
 =?utf-8?B?THZ5OURYanlVZzhxNVkzMS9pR1JCd0o0emJua0k0VTRPY3NDUWwwaDc3bUkz?=
 =?utf-8?B?bTJIVmZuV2VlMWdkZE1VeFNvdzAvc3VYT2dWQmkwMWg0RkF2VVArRjVYTTE1?=
 =?utf-8?B?Y3pjeXVCNkw2K21GTTBNQXZJTGFEVFVRbXIzN3ZLS2ZYY2VJY1Vmc2RUOHZ3?=
 =?utf-8?B?QXEzbGIreGVlcGcrT1lTVmZHbkdiTGZnWVUvVkVRczA1SFpmYzMwR2pYd2Zv?=
 =?utf-8?B?M3ZwMzFHRFNIYUNKdnRNS1YxbXFzdmdCLzVlNlVPckFQY3kybkVUeFMyc0pq?=
 =?utf-8?B?THFNRDJFZTV4TEQ3VjdYQnJ0L2JiSzUzaWJ4SVdhUjdISDVJbWRzOW1OeGJG?=
 =?utf-8?B?QTR3MGVsWjBvdVpMZzRkRUZoeHlici9ubGVTSDAzVUNOaTAvd2V6VkdaMm9i?=
 =?utf-8?B?Q2k5NWVLb1pDMWNLRlBBMnpLMTFrTHBjOXQ0Y2F4dFpJODlxZHlxTXpmWVMw?=
 =?utf-8?B?bFRuR1ZWSE1ySXF6SFVkNDlyNzVVUzVqb3pCb0VzVzluMUNteHpreGtmc3BS?=
 =?utf-8?B?dVhDVzU3RGV3S2kyZ1YxS2Nib1Ezeko1b2dYcWhacVV6SUNEakk4NlBBWmRx?=
 =?utf-8?B?UVJBT3NDYjZpTFhUaEV6UklXUk1jeGxrYTd4azhJcW5FYlpOSk52RWZiSnpX?=
 =?utf-8?Q?pJox1sHD4IfyLfvKWQ+sfrgiX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06fe043e-9489-4746-d85b-08de3a918928
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2025 21:49:47.8960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 X3sqlSwBok/cqn/qUpOkQDO/9Lqy1j1Z6hLT81wyUF5Yrtt8oZmuoWpgWAurkgJJIYOsrC5ZOtdChLw8UHCe3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999074
Message-ID-Hash: ZMMPUGZQDWTGJOJFEDCFALHDKCREG2IR
X-Message-ID-Hash: ZMMPUGZQDWTGJOJFEDCFALHDKCREG2IR
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZMMPUGZQDWTGJOJFEDCFALHDKCREG2IR/>
Archived-At: 
 <https://lore.freedesktop.org/85F0720F-116F-478A-B598-D197F3032DC4@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDE0LCAyMDI1LCBhdCA1OjQ34oCvQU0sIFRpbXVyIFRhYmkgPHR0YWJpQG52
aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gU2F0LCAyMDI1LTEyLTEzIGF0IDE5OjE5ICsw
MDAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToNCj4+PiBiYXNlLWNvbW1pdDogMTg3ZDA4MDE0MDRm
NDE1ZjIyYzBiMzE1MzE5ODJjN2VhOTdmYTM0MQ0KPj4gDQo+PiBJIGNvdWxkIG5vdCBmaW5kIHRo
aXMgYmFzZSBjb21taXQgbXlzZWxmIGluIGFueSBicmFuY2guIFdpdGhvdXQgYW55IG1lbnRpb24g
b2YgYSBnaXQgdHJlZSBpbg0KPj4gdGhlIGNvdmVyIGxldHRlciwgaG93IGRvIHdlIGtub3cgd2hp
Y2ggdHJlZSBvciBicmFuY2ggdGhpcyBhcHBsaWVzIGFnYWluc3Q/IEkgYW0gbmV3IHRvIHRoZQ0K
Pj4gYmFzZS1jb21taXQgZmxvdyBoZW5jZSBhc2tpbmcuDQo+IA0KPiBUaGF0J3MgaW4gTGludXMn
IHRyZWUsIHdoZXJlIHRoZSBkZWJ1Z2ZzIHBhdGNoZXMgZnJvbSBEYW5pbG8gbGl2ZS4NCj4gDQo+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC9sb2cvP3F0PXJhbmdlJnE9MTg3ZDA4MDE0MDRmNDE1ZjIyYzBiMzE1MzE5ODJj
N2VhOTdmYTM0MQ0KPiANCj4gZHJtLXJ1c3QtbmV4dCBuZWVkcyB0byByZWJhc2Ugb24gdG9wIG9m
IGl0LiAgDQoNCkdvdCBpdC4gRldJVywgSSB0aGluayBiNCBkb2VzIG5vdCBrbm93IHdoaWNoIHRy
ZWUgdGhlIGJhc2UgY29tbWl0IGNvbWVzIGZyb20sIHNvIHVubGVzcyB0aGlzIGRldmlhdGVzIGZy
b20gd2hhdCBpcyB0aGUgdHJlZSB1c2VkIGZvciB0aGUgcHJvamVjdCwgaXQgbWF5IGJlIGJlc3Qg
dG8gZWl0aGVyIHByb3ZpZGUgYSBsaW5rIHRvIGEgZ2l0IHRyZWUgd2l0aCBhbGwgdGhlIHBhdGNo
ZXMsIG9yIG1lbnRpb24gdGhlIGJhc2UgZ2l0IHRyZWUgdXNlZCBmb3IgdGhlIHBhdGNoZXMuIEF0
IGxlYXN0IHRoYXQgaXMgd2hhdCBJIHdpbGwgZG8uDQoNClRoYW5rcy4NCg0KDQo=
