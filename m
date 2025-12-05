Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59874CA5C02
	for <lists+nouveau@lfdr.de>; Fri, 05 Dec 2025 01:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B4A10E9E5;
	Fri,  5 Dec 2025 00:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VIDkL643";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013061.outbound.protection.outlook.com
 [40.93.196.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D00310E9E5;
 Fri,  5 Dec 2025 00:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGi6S4zWP6aoId7vOx+fa+0Sncj85TXldv+Kcpi6sAjx+ySRIpzac+HB6PACUOb0N9vTrRMa8F3kocpQi8cDd2C7hFLumHrnKWOgsZZRng9jev0jP651EWu0eCfwC8TV5yjl2sr5D3u6ySn8Ng+A57CPVRAizJF2t8CkvRTpwMgpMphVTJUbvSr2yxzT7fOXwjpWFEQe4YjnhGoySbZcGPjmCloby5hNT09yQlxshSlwyBK1vsIJfhcLBSuxxq43yMFcBfrvGv9F4BixXOy491DVWnLN5yGV5v28SfaOC125wsnnSA2E7P4ZWJCYmaJfYaNJT1TbZB6egzGJdyYRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUA3KfFD0pzuKwb22QNfiAuKpf8nABlHpRm3QCLADPo=;
 b=VcuP4bdbc+cS5gIKcn0Edc/fefq/HHavrezhWE5N3SSE9lW43ZXmbrZdkzIftfyqXaG//CcrMdp+N22vcbxKIA7w5KiAY6VmLOXGOQttlcfNxrKCRppwbaih1As0ar42nCWPKJPWB4Iqwhf1rR0cgyn/IA/+r2TnTGyTO2F1TKpUZATaauvShvpQWaicF+Qf7CBdqs+JrqewrPMFfL6Ydd7U5pJzeBby6sDTHvUfmxpz4D7Y52WhnSHDFNYEx6SCsHJ0+/Wr3/Ni8MWb3v+6UIBbTioYfsmwWjlYQbAtcp/nNDyWyea7mAiFQPM8ZdxaIZW6Y5mz2+f7zB5Gv8jfkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUA3KfFD0pzuKwb22QNfiAuKpf8nABlHpRm3QCLADPo=;
 b=VIDkL643dlbUdvWRZOAvaxt9I66jx0YlbgCDhlYBbgDyz15QjqQsPoLnQYgUXG1mhZ8eV3/6dV9wBlpqEJaKjeRL0rldRCqpI8P30MWpFF6IKrlSo2Er6uBXouI2FXZF48MMtx+7tSBV3YXkGPfmRSirX6n9CA6z31HlKx+fKxvciGhu3teRUdU+M+b0Ihvs+f71qvR47EiFbgl2rGxrjwJcwOy/40KCMLxqP/8jrQgLawA952wCCTzVRZkpR6UImznFTBqtSVgqzyWZwJINTi2q1tOyyE1rILAMjIOO/RAKVGAiwGW9vths1c72tHP6IqlviPTxj0xTcobbF9SshQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 00:35:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 00:35:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Dec 2025 09:35:46 +0900
Message-Id: <DEPV1LDH9K7I.2GGJ4YQ6UMGMS@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument
 size must be page aligned
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
 <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
 <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
 <ae07b871896b79e3d6180874dfb07d4d3aed4bdc.camel@nvidia.com>
In-Reply-To: <ae07b871896b79e3d6180874dfb07d4d3aed4bdc.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0370.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: a4586e85-1b9d-4f77-de39-08de33963cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnlERmJlZjJZK09QR3pqZEZYRDVKNVVkRnRLYUNjcXdKbURmYnBRUkRrZThm?=
 =?utf-8?B?R0poNjB6S2UvQjJBTVZHTWZjNlBJZTVVT0hROEF5MWRhbGdEVXM2VnA0ODMw?=
 =?utf-8?B?R25UNy9QcmcvN0RJSnJiRWtpeFdVWWhvcDdFZ1JkYlp1c3JsaEF1dkNoZ28x?=
 =?utf-8?B?cHpUQ0RIeUdUekwwTjlRUVdxMXN1b0JDVFFuRHJRbGMvc2VWZTVTR25WOGN2?=
 =?utf-8?B?OEpMN0w1Y1dsS3pSdDczZ3Zrc3RIemcrNHl6NmFsZjlEZDJENkt6b2dwdmxC?=
 =?utf-8?B?eHdjNU1MOHhQd1NqLy9meHVEelo1cjJJd25wUk9jVU9DSDY3aFhWcFhCNWJS?=
 =?utf-8?B?QnFVeGZwdkVFS3ROblIwN3dhdTNweHg2ZXZETU1RbFprdTdqcU9LeVVSNjA0?=
 =?utf-8?B?QlhlbFNud29BMFpFSmZUN3YwMXhzVm04N2REamlXdjN4WS8wYlpXSjdvK2pq?=
 =?utf-8?B?VEhKOUZZb2gxSnM4S0JSOSt2MStjZmtiV0VGdGNSK0dCQWhKaVpnVXUrck8y?=
 =?utf-8?B?S3J0Q0JLWGcxNTFpbWxvUVJBeU1SQTYxS0dkNTRLR21EeG5nc2p5RXhkbVpE?=
 =?utf-8?B?VGdpdVhzd2thcXB4d2R1MnM5cmpsVHlFRGtIOUx0Nk53Ti9OcFNCeTVKd0wy?=
 =?utf-8?B?b28zdC9yeTlvamF2U3lzOXRoSWRLcFNwOVJON0hoQU51MkswZG5XYjdnVktu?=
 =?utf-8?B?emxOKzNNUkU1UmlvcktSbTBLNnZJZkdCelhIU3RJV24rL3c0ak1naWxJUy9M?=
 =?utf-8?B?VlhxdU9zc0xZZjl1b2RjKzRISEhaalZWcXduV2gzaE9iZ0lUb1ArcmVwenZ4?=
 =?utf-8?B?L2xyUnFZU3pXeTNtU1NsaGFlWUJHMGZQODltOUdtR1dLbHJRdmxOamFTR3hv?=
 =?utf-8?B?a1Y1STI0b3J5TFVrcCt0V0FrM3JkRGQ4SGFZRm5OV2xhVG4vQ1N5QnFFQTJv?=
 =?utf-8?B?VCswWXRUTXp0ZFNabml4cG5kM1QydXJxcSthTzhFT1N4YXZWMVN0N1pqZkVO?=
 =?utf-8?B?VmdQSFZpUENJclhoYjZoazdWbHY4ekFsYjZJdXhiNTBoVUdiQkZhRlg0Y0pD?=
 =?utf-8?B?RjJBSWU2b3czU2JMdUk4eWlIOHFXVHN6L2U1Q0o4N3duRHNES2RKQ1h6KzhL?=
 =?utf-8?B?dVVQZEVVSGJxd0hWd0RRU2tGWkh1QXdkYzJwR0k2ZTAyQ0h0STRjWW9GdWJP?=
 =?utf-8?B?eXhVMTdHMXBNV0R3ci9iTUdvNzdiL0lJYTcrWXJJeDhnekY4b0k2VVdhamNa?=
 =?utf-8?B?c0dWdDFtUVdPYWkvMi9PSHJuN1BxZWlYWnpGVElEMG1IeW14RXRCRkdXNUNM?=
 =?utf-8?B?ZE1kcTMwUnBtVlRTamJIZzZvaFE0Rk1kc3hOVXhuMXNITjVGUVdadFpCMnNK?=
 =?utf-8?B?elN0eFc1c0ErNWNrUU1RbDdMWjJ2YndVQmE4OTFUZHh5eHJtVVc4bHpiV2dI?=
 =?utf-8?B?Yk5xaFJRdlNpYXlzSnpZZEd3enAwdk5FUk4wcFJsNFRFNXEvMFFsS2ZsQm4z?=
 =?utf-8?B?bk9tM2NoV20yMWRtMStaYWlFWGo3elQyOUVSUnpyL3QzbDEzeFI2VTByb3lu?=
 =?utf-8?B?a3p5NWxORkg2T0lnYTVVTzRVblgxUktYTmRSemtPSjZNL2tpanE0aFlLOSs2?=
 =?utf-8?B?TXlKeENTT1JhSVNXTXNlcjJhWWlIRzFhTjlYMWZLdWYrOE83d0hOR3VMVkxk?=
 =?utf-8?B?czhpYVBIenIyNjE0S096VWVMdjd5RmZpQ1Y2Z2ZLTGxmc0JuS3BjZGNEVjdM?=
 =?utf-8?B?dEEzaXNDM0R4MTcyWTE0bWQzNkQ0VmYzbnpmQ1RUa2JPZW51YTlBWjZhYVJI?=
 =?utf-8?B?UkhRblFOV3dBQm5LRHZyaHpEVGM2bExidnRWd0d6QjhiOGV0U3N4eFgwQUdV?=
 =?utf-8?B?WkIzeXl5STZldnoyOXZUakd4Uld4VGRCTlFaSHlKclFOQVN6UFhKbWpzc2VF?=
 =?utf-8?Q?cOPcuJcjzljWQNoB/86vcDixeqnm8mEq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFBCU3owTHlQZTZycUpHMU1NN1dCd29rMUpodlFQL0VHbTJENHp5ZFkvbUx5?=
 =?utf-8?B?ei9tSkxrNHF6Y3hUeW9zdlJiNU9BTU9mNisrVm1TdXBDWjFrSm5oNXlrS1RG?=
 =?utf-8?B?M2lkdGNodUhUNTA2eklpeEJjTzJJM1cyeGhIbzdTSnB5eGFwbERCc0VQU3pU?=
 =?utf-8?B?dVZYbXkrWmdhMTBUVUNwbGtaUjdJREtRQ0YvY0h0NEdCSjk4azhSQXd4eGFB?=
 =?utf-8?B?eTV2bk1Uakt4UGJRL01rVjdLbkJzRXQ0UGd2LzI2d3NieDVWWm5lc3dGWnEw?=
 =?utf-8?B?dE9ndi9TMHcvZ3VMM1kwczZzRFFYaktuWWNWcy9vem9ETEdLOHJQaWpxdHpO?=
 =?utf-8?B?WFFCd2JNNkhrdk5NOUZwTVk4VmNpRzRCbzA5WHVyK3N4dy91RG9Wdnd6Q3F2?=
 =?utf-8?B?WG1JSVBZcDVWOWIyYmM2QXYxY2F4MjJlNEFLNzRGdEc3T1FzTWc4UGZzWEVT?=
 =?utf-8?B?Q0cyc25wSWZkVDJVZkRQMCtrRmJidnd6UmlJWGU1cU84SStPQkpuYlRoZDRO?=
 =?utf-8?B?Uk5kdEp4UXcrQXZWREEyL1hjSlNOc0REMTZvNmh6QTJqR1RhMkNTam5vUEwz?=
 =?utf-8?B?cld4WjFibzhVMUdUcWdZOXc0N0FxazVaeWVBKzdKcGV0QXVsVEdQanE4TFBM?=
 =?utf-8?B?QjVtOFNzdEF0eWxIOVBGQlV5WDdCeUdzT2RuMFUrZERCcm5nczZENytJaHZm?=
 =?utf-8?B?aWJZVkRnMVR4UWZ2Q2J5RjFISTM1dTN2K3VmM0lmRGdDWVA4cU84dFlac1B2?=
 =?utf-8?B?WnNLN3JNc2Y0TmtOTVpBVi9xUUFhcm1NSVNLRDB0ZldKVG1HTWs4UGFzQUt1?=
 =?utf-8?B?OVZaVzZNMXBnMTZOdFY4bklTakpxcG5HZXYvakRvVElCdDFNcHVRVHJOdTFQ?=
 =?utf-8?B?MDlpSEpMUERDanEvaEpqSy9tS3IwOFVPczZ1QVpoNFkrNmxuMnhtSXRROUg5?=
 =?utf-8?B?L2E4TzB2TkZwV0FQa3hFc2s0SGVsTnlMUDBBTWx0NVAzb3E2VUVKNHE5c3Bi?=
 =?utf-8?B?YUVGb0lFc1JYRXViUDVTV2JSQjhxNnV2R1pkbFNHNjlXMFFPRVVsdWNiTVdP?=
 =?utf-8?B?emdFOEU1cWdxTVdkdStVQUJLTW1rUEREdlp6YlhDMElVWUFvUncybmVMdnJy?=
 =?utf-8?B?NzZBVS9oRVpYbXZSNHhJRElSaEN4NldlVTU3WUFZQVpUa1AzZ2NScmhmcFRz?=
 =?utf-8?B?QXBsbU9KOUEyN1ZNU3BxZUt0SFpnYjhQemlKeUFrZXdKcWkzRnJiZWVTL3Fq?=
 =?utf-8?B?eHhUQkpGekdiSDBPbjlmbXB5SjMvRGl6MkFqcy9oSitmV0dXZEFocjFCcG5C?=
 =?utf-8?B?dVVNQUlDYTlJM1RZRlBLUDhkNS83Z3Zldjg4cWh1UDV4ck03eXgvYjF1UmhT?=
 =?utf-8?B?NlNVSnM2aFVHRHVwNWsyUmdGeTdnNG9uSVBWc2g0cUVzOHA0RThlNzlWQ2tH?=
 =?utf-8?B?aWZuWUkwNkZhNk9qaXp5ZnYzQXZkQUZJN3h2amxtbXdqTEdETjltR0U4R0hU?=
 =?utf-8?B?NDFlejF2V0dJdVlMUDJMNGdRd0IxT1pEMVEyNU9hM1hIeGxTejlVSjkwZ3lI?=
 =?utf-8?B?NDRsLyswbjV6MzAvMWRaQ3ROQlF0Ui9EcWVlQXdOanlMckNnUHo4K2o2cVhI?=
 =?utf-8?B?UlRJeFRZejBRMEFsRnJTTStJVVBaR3RWTDgydTRockFKVld3TkJOU3QycUJE?=
 =?utf-8?B?Nzhnb044SVlua0hZY0dnRS9kZWNEL3NDYXZPQkZXTzFtZmFYRXpTNDAwcDhy?=
 =?utf-8?B?dGkweHczR2U0eVVEU2FiZlkrQktYWk8rZktzcDdDT00yNGFyVTFTelEvUXRu?=
 =?utf-8?B?L3h3UEVsRC8xa21ZaWVxUHh5SDhoL0MvbjdYL25Sc0lHdUVaVzlXSVpBNFJv?=
 =?utf-8?B?STlkSkJFWnpwbXQ3NWhPOUNmWmxFTWo4akl5U2gzK2RiajNVZm1MSjlsSXlO?=
 =?utf-8?B?K1psQzZHZkhqRk4wcG5NUE9RSGxySHY2ZndtOWVPS296dE15cVZ2Z05XcjZS?=
 =?utf-8?B?VnNKZ0ttM2dIS2NkS1M4Uk1qRFloeWorUE5oU0N2aG5RQ2dSaXhlWGt5cHd6?=
 =?utf-8?B?cnZubXNBQnJIWXpmcVhWY1VZV1prbzloNnROenRLU3F3cmprU21tRlJhQjNH?=
 =?utf-8?B?NFc3dEZLNlhWMTJ5Sm5ZbWV1ZVlrSUd0dlkyRzlleG5XdTMrTHVkUkx5dkM0?=
 =?utf-8?Q?Ai+xGjdNh3bhlPW3E/3GUXYUe8rE1aJ1crxx5ylO75hK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4586e85-1b9d-4f77-de39-08de33963cfe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 00:35:49.6947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQAI4gNz98Lonb45cuhpMe4DABVBWkaLBBTyzXP5lDdqmLqz6ws4L7+EsHvPTQE/zux6dRRZNlomuQmradUp9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
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

On Fri Dec 5, 2025 at 6:45 AM JST, Timur Tabi wrote:
> On Thu, 2025-12-04 at 21:18 +0000, Timur Tabi wrote:
>> If you can tell me how to fix the CoherentAllocation allocation call so =
that it allocates 4K, that
>> would be a better fix for this problem.=C2=A0 It's only necessary for Tu=
ring/GA100, however.
>
> Actually, I think I figured it out. =20
>
> /// Arguments for GSP startup.
> #[repr(C)]
> pub(crate) struct GspArgumentsCached(
>     bindings::GSP_ARGUMENTS_CACHED,
>     [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CAC=
HED>()], // Padding to make
> it 4K
> );
>
> impl GspArgumentsCached {
>     /// Creates the arguments for starting the GSP up using `cmdq` as its=
 command queue.
>     pub(crate) fn new(cmdq: &Cmdq) -> Self {
>         Self(
>             bindings::GSP_ARGUMENTS_CACHED {
>                 messageQueueInitArguments: MessageQueueInitArguments::new=
(cmdq).0,
>                 bDmemStack: 1,
>                 ..Default::default()
>             },
>             [0u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGU=
MENTS_CACHED>()],
>         )
>     }
> }
>
> If you think this is okay, I'll put it in v3.

Yes, that looks like a good way to address cases like this (please also
make sure to detail in a comment that RM is requiring that padding).
Having the constraint encoded into the type guarantees that we cannot
miss it anywhere.

With one caveat: `new` now returns a 4K object on the stack, which we
definitely want to avoid. So maybe we can have a wrapper for things we
want to align the 4K:

  #[repr(C)]
  pub(crate) struct GspPageAligned<T> {
    pub(crate) inner: T,
    padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<T>()],
  }

We would then allocate the CoherentAllocation using a
`GspPageAligned<GspArgumentsCached>`, and initialize its useful data
with:

  dma_write!(rmargs[0].inner =3D fw::GspArgumentsCached::new(&cmdq))?;

> I had to remove the #[repr(transparent)].  Is that
> okay?  The code compiles and seems to work.

As long as the struct is `repr(C)`, the layout will be what we expect.
Actually this made me realize that `repr(C)` is technically what we want fo=
r our
bindings abstractions, not `repr(transparent)` - both happen to have the
same effect since the wrapper struct is `repr(C)` anyway, but the latter
is more restrictive than we need.

Glad we found an elegant way to address this!
