Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A5CCB98C
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 12:24:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 34ACB10EE82;
	Thu, 18 Dec 2025 11:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b98nQU+8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B6FC45656;
	Thu, 18 Dec 2025 11:16:46 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766056606;
 b=zs4KsR165GbUN5FZZmkanRT78V4VzWLpVqv3gRjsn42jUvKM+VNy2Nnor2vsuPVY8+uwU
 kbcLbL/bNWu9vMkNWUKne+0TPPYWdjnmzD4opQv9ieiNzWgNcjJNhUrwdZn5Zo8td7yIOz7
 xFZmVutnesIgUPHq+WXiq66e8RGv4iD/TRTcQmIaLnGZwp+7XQ0FeEBaESNfUEGIje9BmvH
 MsG3k62apbWJ08MHgz5rHQEGmPeFQO2xItUvVOWe9vbsf6Ga/1YC5cGYbG1EgN64s2laf6l
 bD36B5Xp6vp82WCf/LP7zzqQd+h106Inx8SnOgthsm0QSArL4Mve5G7gn1GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766056606; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=S6WpaDZylOITtFD0dsImTQVplvrcdTeTTYwOcjjpneo=;
 b=zR0LZNAEgXbz5oxYJSduCv/TyXsoMxcE6tjYj82C0urMXhh26GSPWWlIhED1HZTv8P/L2
 JSgxpC/3+ukedSALlkR49eo+gs/RCAUCWKpeJkmBxCz6Di/QwArFV33pBdQs/MyfNJ95EBN
 PzGbxw6m0E4Poj8QI3KPB3PEnElAujFZPqxXplNkHUpNzQrbvXfhuSWEfOlsVnfGE7tZjka
 q5bwszownc2IKAjJoQBwB0nMJFAWvyQJx/s/y1lriwv13+/51MjkFx51RsMcvQWLvvsQ23+
 IRMFZtXVBtd/xL8SieGfV9s/k95g6ubSXW1wvCqfEuMGasPEiAbJac3bSlkw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EB14345656
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:16:43 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8F10EDEB
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THC7peTmCxkzcNhMwSDlsgBGYGKS27kqJ6FePoetjvo1+rseWnERromlW9Gl3adSpsR2kRIlHGmjp4YEQkvVWCBAnePcgTsnj6A0LRyLjhuc4igRfiAbCwDJYu4JZvKUC+fMHXdWUausKGUg8bBMbJ9y93bZxB9UWWGu7Hu0nEZfXvcrEhJCdZF2NmsbDzK+CzRJFgXuTa6vQ18YcQGBUj45UhZ98wrjpCRC7ypjiF13c/y0IQCU0LiSeGGft603I89g3z61iG8Ew7rug3Z40qr0MdpapQl5EKnI2l6f63aemBtoms2QglN0C67LB2dsobaiDEaVZlO4TkwMLhRBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6WpaDZylOITtFD0dsImTQVplvrcdTeTTYwOcjjpneo=;
 b=plL0SNf3+LKBDUbiFW6A31GsWW2/+Pz05PH16KWJ4/9vDFkuf+j97qcPgTGfFOguj7wtyEOcNMbh3FnLORRJqqxFw6uAz2Oy5HvkGqQbfzkRzwtBQhIdISvXi+XK6m0tKrV5oMqeZ8cHySwl92q1g+BRpKYUDQXFdJNnfo0iumwE6zFx+dHij97BzzeDjia18m+HV+pEkZfimGbSSqMUTfmxC550GoEGiv4ax/VvzoRkOZ94UoBqaiBgael2WWbzVXSKnyEZWq7rIVD6NIV8vozVrAxVmDmg4KBtr3APErch3Y3EPolblzejZa/RG+fkW2OVJjxs33eazM0WanC9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6WpaDZylOITtFD0dsImTQVplvrcdTeTTYwOcjjpneo=;
 b=b98nQU+8FmiKUBN03IHtZRoffS/6daWg7lCM2pR2wh5K2BGNJljfLfpuMIVhLxp+1Un7XoRvW+fl135y9ZryBxM9fSXop5Q2sNsVAY49uEbmvjYjXLGyxdgOHi9CkHW/HN4kvpLeWwgxKLC8iFdxTFLn64sGfOEWfEatn/MfoAc3ld2JP+LxO7kGglD/q7TPHtbVM+g0ELQrhMfBg9T8PsTcyw53UO1ft4bdL06EVPamoZDAizQqQw0OkWrB+fKvnURfqki/e9j5SJEJLDrq0ZRnvLT//Cp5Lo3ieCwolXJHDzB3IRWyHcOxbT+KIf2by/Zz7fAs8wtfqQ2SBETrqA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS4PR12MB9682.namprd12.prod.outlook.com (2603:10b6:8:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:24:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:24:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 20:24:06 +0900
Message-Id: <DF1AZ2RXM0XC.2Y727UF1GPS8F@nvidia.com>
Subject: Re: [PATCH v4 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-6-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-6-ttabi@nvidia.com>
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS4PR12MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e0f1c7-8a6c-4f10-9c07-08de3e27f699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TE50WjJ5bFNYV2o2b29SS2tMTndPZHU0a2pxSjZJbVlZa0JxZnROaHVFTzJE?=
 =?utf-8?B?Sko4VUcvRzFBR2J2RDRDbmZMY0FYaWlUd3VIbE0waGU5UEdCWi9JZ2dpSTdi?=
 =?utf-8?B?KzJURkgrMitsWGYxcHp5Y25KeWRwU2hiVzNQN3piVm1ZbDZYNVBZQUxaZUJ6?=
 =?utf-8?B?c1krWW1RS09pV2s0Y2ExOWlMY1luL1E2bDU2YnE3OUxmRGZIdTI0MHJkSlZr?=
 =?utf-8?B?Q1c3d1ZWZ2dvcGJwQmFOclFibStRaExXWEZjNW92YUhxdXliZGpjbnJHdk9w?=
 =?utf-8?B?UXZTVjkrUjVXTXd4UjB4dnFlNHg3SURlcm5FNTJSYmdOR0o0Qi9SWlZ2T0Jq?=
 =?utf-8?B?WUhHaGxEZUE5TEdOQjdwaUVkd3Mxdkk1UU1EWklXQy9xSFdxb1hDVDVtWnZD?=
 =?utf-8?B?REJiYU5CQUlxdVdwd2hKd2YvYWhRRGpQcEdqTUFxN29tTDJtYmxEY29kVzVz?=
 =?utf-8?B?OWQrN01yYlU5cGkwTldBenJYUk5nenEreUF1VHd0dG9NQjFsUGR5YWlXVUtw?=
 =?utf-8?B?Z2JrTkV6MFgyOWNLVFc2VEhKRTNra2w0U2ZTNmo2K3laRFJpT1pIYU1PYWkr?=
 =?utf-8?B?MFVkWXlBSTMrUlp3c2FFZ2lkQWFmUnd4S2lsd2x0VlpzVmVpYWhWSVhuV1M2?=
 =?utf-8?B?b05hU3NHU1VvNUMxUFVQeSsreDBzREtsS21TNlZ6OUFycmZyazdSbzB2M0I4?=
 =?utf-8?B?aEF5aFlyNHZhZzFrU0N3Y1pEcVhrSk5QVTI1QktRNUNha0txYUZLWCtMcWJC?=
 =?utf-8?B?enRueEdDdWlLODl6L1ZVRTA0aHFuRnlaVEFjT3h5NGxCMnFEQ0k5S1duNG9Z?=
 =?utf-8?B?bWZOL0tidDRFblI1SkZOU2lvMXErRnVpZkh3Tmh6MVJJdHlCdFRJejREbHIv?=
 =?utf-8?B?U1dZOEhOUmxFazNOeFI3Q1lXclRCbzhmeG9KUmhwUjhmcURsTGRtR1RYWWhF?=
 =?utf-8?B?NFR0eGxHUGc4R0RiRlk4S1JpaXFBSlR4YTBIaElLQVhia3lqWW5BL095QlAx?=
 =?utf-8?B?ODNtMmhPS2g5WVJhKzRFRlBxUG8wTytBRkpHNnNSL2lncTk3NDZIa3FaSmUr?=
 =?utf-8?B?dmVQSUhNekxxWHFHa1c1UjNlcDV0RFpUem5KRGtGS3d6dm05RkdLQm9KRjJM?=
 =?utf-8?B?N2wvSE82WGVETDdGS2JMcjUreFZoK0swbTdhaEtvZXVGZWI1VUYrMllFY3BQ?=
 =?utf-8?B?aWdYd3ZYY0RzamEvVm9ZTHBtSktDMk43NmM5Nkx1dC9td0JQbXhxcVNER2ZT?=
 =?utf-8?B?ZWtaN3dIdi90dURCbkxNTG5aSFFuRWVXWHl5bXl4dzgrY3RWUUtETWpQYUpj?=
 =?utf-8?B?aVJQQkx0VFd0ZTJYM1FidzJYU29zY3FYRUx1ZmkrSlVQRTJVWUZWT2t1d0tR?=
 =?utf-8?B?UkJGSDlSM0QzNkxSdUdpTGp1RENVZ3VlRk5PS1VaT21BNDV6TFdYc0xnSERE?=
 =?utf-8?B?eXBJbThiVVR4RUl1Zkd1b1ZXYlhlUnNldUpIWjUvQi8zK2cwNEtxUTFZUzFU?=
 =?utf-8?B?bCt1WGRicllGWnpiMDJhRUw2OW00UWhXbndKNDFaaEN4ZmNpaHZPc09TQVpm?=
 =?utf-8?B?UGtMUVk2T3FCb2tCamFjNFhtTEt3VVlYUXYwc2UvM3pIaDJ5Z0JZWVVIeG5K?=
 =?utf-8?B?NmtoZ0ZKVElFdUxkNzgwZklpczVsYzhGZFJ4OU5XOWE0djVyb1JpQjhsVHVt?=
 =?utf-8?B?Zy8xenJMejRLMW9DbkI0bzY5Y3VhVjdzZkdqSVFubHZ4aFJGMS81VmtxL1Fv?=
 =?utf-8?B?b3FnNEg1bXpvWFRPS29XWGJ3VjdocHlDKzdtaStVaTlnZFRyMEdybE1ibEtl?=
 =?utf-8?B?eE8xMlRZdDJ0cVd6L0tTa2xyeTZPMjZhWFhUVCtZdGtaYVZmd3JqZG10bTZP?=
 =?utf-8?B?VGU1Sm02eStWK0JRempWemVnc0l1RjhWWnRRV1RUOHRDMERqVFJqK3BUVVNK?=
 =?utf-8?Q?XgSoacu44X2TEF1/P87odaHKLTJM8EvE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUZXd3E1T0NSSHNqSXFMYWR3eHdHNWZOZ1RabWdMdjRkM0NaZ1NuN2JUME42?=
 =?utf-8?B?K3cyeEt0cUxDV2k5ckhaMjE0K1MvMGcyTHdmcjlNTTMxSkhIWmpZUSs5WjRM?=
 =?utf-8?B?S0pxd09ObDZNdG10U2o4NmN4bTFDRTJEeHlXdUtCZ2k3VEVLSUsvcEQrQjhK?=
 =?utf-8?B?UE1LYnQvbnljLzhYU1ZQdzFUTmZzKzBKcDV5U3BKTS9SNjZkZGdEZlhBK3ZM?=
 =?utf-8?B?ejdOQ3NTejdxUFoxSW1rRG83eEpkTFlCS1hhVUFZRXByUG8wV0FtNVN5WUlJ?=
 =?utf-8?B?OWo0bXhMNnl2ZWZOMXBmYlVnQ1JpWXoxK1phTXRsWk1SMWt5dXJrU2NlL0Yy?=
 =?utf-8?B?Q0h6VlFCSmpzVjUrelFQVUlYVGxFOVc4RU5xUFh1TjZOd0VEUS80Sk9tSnRa?=
 =?utf-8?B?dkFxd29VV3F1QkVWSklOY1JTL09rOG5nQmFhMkFFQmgrd3NaQm9LK1c0bUtM?=
 =?utf-8?B?NVJWR05rbnZlcW9rYTBsVWdPZzRoTy9jUUg3M21MaGxYQlNKUmRSeUl0Smxz?=
 =?utf-8?B?SlVGM2pEUjlDb2ZFYmtQWmtyQUU2OWVDUURnZm1ldmVmb0hmRGIrT3k0NCtO?=
 =?utf-8?B?aDZTK0o5dG1XVHlpOHkxNDEyeEUyakVzOWlmMGVKSDVnYkVGUS9ZeHc3Kzl6?=
 =?utf-8?B?WWhVVUpuSFRRaVkwNHdpUmdHamc1Rm5CRFgyb2h5TEZzbUdKUWIxR3EvaDVI?=
 =?utf-8?B?clF5WVRQcFFCcTRCZjY1c08zVUhheWEwcDlZYVlkWUY1bzVLcTBQdzRycnFi?=
 =?utf-8?B?Uk9XZ0RqcGlkdTc5MzRMOHVCLzhWWlJpVEtEbi9pbXFtT0pZbVYrL3FMVUc5?=
 =?utf-8?B?SEE2M0NLMnRsRlZrK2d2TkU3bGVHc1VXaysrcm1zckkwSU00TE9FcCtMeStx?=
 =?utf-8?B?dUNFUFRUcXkrZG15RnJGUHJyWnFNL1hMeEVGR1k0bGRHcEdDcTAwM01INGla?=
 =?utf-8?B?NGdZMFRDOVFWZDZ5bU1iek5zemlDTGZpbnVvT2tNdHYwc0NwNE5RbExpcTBv?=
 =?utf-8?B?SFh3dy9WT0pLWWRkOE45OVAwRDJrSlZNTE5zMFFpT1lyR20wbjBEK280N3RV?=
 =?utf-8?B?cjlJN3hyNnhMWGprTnJjUlhKS3FISUlhaDBEQ3UzN2QvYk96NXdsZGpQNXEy?=
 =?utf-8?B?WTAwdjNWRUIxczNERHJabWJsZ0UwcDdXOXdEV1FKL0ZDcEI3Q1RUQUptT3dG?=
 =?utf-8?B?YW9QNHhUdHJ5YjB0bHpmZEd3cGhlWEtlcmpRLzlMc3Rhc3BycUQyQVkrVEs2?=
 =?utf-8?B?KzJMSWhBd2tlYmtqYXhqeEx1VWl0a2hPVHNBbitHemdraC8vVWJoc2ljRFRZ?=
 =?utf-8?B?OGZyczE3WTJqaG5PT2RDejZLTE5hWE9ROTE5bVk5WWxDbWsyNG5Ldm9QcFh3?=
 =?utf-8?B?VzhoY0VXSFZZV1RuZTh0K1BOQWMydm9xUVRDdnlITmF1TWFzSTI4UEtUeDZl?=
 =?utf-8?B?WE9reDBCT3Z5a0dHQUUxd0s5SWFLbmNWajZFbFVrNHpxaGhKNVJHczVxSzZa?=
 =?utf-8?B?dVVuK2x3dVdSdkloMkNWcFd2VnoyUWZWODBBd04wY0RLZzBiaG1aRjA4UnRh?=
 =?utf-8?B?WkpuRE9CV2cxZUZKb2dDMHVoMDM0OGI5OVRGQVRpbG80dmxoUDRERFlreEY3?=
 =?utf-8?B?UnB3Q0ExRzd6Y0hlQWRqU3VUOEFEc2pxWUNsaWRVU21BbHl4aWR2akFhZmhD?=
 =?utf-8?B?L1MrVzVRVkpQRHdLTUhFWHJKblMzRG9LSldZYjV1OHNOTGpUb3J2RFhDOFd2?=
 =?utf-8?B?eUxuakNvUERLdVZHT291cjZrbm9rT0pmMVNnKzh0NnVNaDJWV0ZQanY2VEp6?=
 =?utf-8?B?VUJpS3YvS2hjN09uMlJad3hNMytmYXh6WHkrVllPeHgzUm5ITC9kUzFlMnEr?=
 =?utf-8?B?YjRhL3RUY29Ed1hoc3JPZG52Rzd0Z1pYQnZIczlrZU1WU0FyU1NoeGxRVzBU?=
 =?utf-8?B?MHJaaEpzMWdQM0MyL0VBMWtjdFNrZHlNcWhQWG1GVGhVYVgzRzI3YUJNZG9U?=
 =?utf-8?B?K1cwbE1UbHVPTlkzbzB4NmlrSXBLdlQ5a0pEQUQ4bzgxSGI5YVo0Wnp5MVg0?=
 =?utf-8?B?bkpRdC9taDVOZDRSaFJhNGN4WGRyMk5MVTBGbytiR2ZqeEF2amJUZzlKY3Qz?=
 =?utf-8?B?OHA4OG5pNUFybXlDL2QyRHJXeWVKcEdUR2thdjJLWUhqdnVDVUwzNlJXdmdJ?=
 =?utf-8?Q?+aosZqqklWm4EPvxB55/2oZkJiSTEuMPkHX8QDHU0KAL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44e0f1c7-8a6c-4f10-9c07-08de3e27f699
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:24:09.8068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O8lCzNfPgCXXBDk7j2KRZQV59WUuDXciw1HQ+becL6Ej/pIsnL+nxludZRcdTDnzIHqsbx2p7zEm2+yxnXf7Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9682
Message-ID-Hash: U2KGWS6RUJZJOAKGRQSPO2EMZRLEFK47
X-Message-ID-Hash: U2KGWS6RUJZJOAKGRQSPO2EMZRLEFK47
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U2KGWS6RUJZJOAKGRQSPO2EMZRLEFK47/>
Archived-At: 
 <https://lore.freedesktop.org/DF1AZ2RXM0XC.2Y727UF1GPS8F@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 12:29 PM JST, Timur Tabi wrote:
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
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index b92152277d00..44a1a531a361 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -454,7 +454,6 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
>          fw: &F,
>          target_mem: FalconMem,
>          load_offsets: FalconLoadTarget,
> -        sec: bool,
>      ) -> Result {
>          const DMA_LEN: u32 =3D 256;
> =20
> @@ -516,8 +515,7 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
> =20
>          let cmd =3D regs::NV_PFALCON_FALCON_DMATRFCMD::default()
>              .set_size(DmaTrfCmdSize::Size256B)
> -            .set_imem(target_mem !=3D FalconMem::Dmem)
> -            .set_sec(if sec { 1 } else { 0 });
> +            .with_falcon_mem(target_mem);
> =20
>          for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
>              // Perform a transfer of size `DMA_LEN`.
> @@ -551,21 +549,15 @@ pub(crate) fn dma_load<F: FalconFirmware<Target =3D=
 E>>(&self, bar: &Bar0, fw: &F)
>                  .set_mem_type(FalconFbifMemType::Physical)
>          });
> =20
> -        self.dma_wr(
> -            bar,
> -            fw,
> -            FalconMem::ImemSecure,
> -            fw.imem_sec_load_params(),
> -            true,
> -        )?;
> -        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), tru=
e)?;
> +        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_par=
ams())?;
> +        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
> =20
>          if let Some(nmem) =3D fw.imem_ns_load_params() {
>              // This code should never actual get executed, because the N=
on-Secure
>              // section only exists on firmware used by Turing and GA100,=
 and
>              // those platforms do not use DMA.  But we include this code=
 for
>              // consistency.
> -            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem, false)?=
;
> +            self.dma_wr(bar, fw, FalconMem::ImemNonSecure, nmem)?;
>          }
> =20
>          self.hal.program_brom(self, bar, &fw.brom_params())?;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
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
> =20
> +impl NV_PFALCON_FALCON_DMATRFCMD {
> +    /// Programs the 'imem' and 'sec' fields for the given FalconMem

Nit: should be `imem` and `sec` so rustdoc properly formats them.

