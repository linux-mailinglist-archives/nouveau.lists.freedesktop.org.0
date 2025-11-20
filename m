Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B53C71B3C
	for <lists+nouveau@lfdr.de>; Thu, 20 Nov 2025 02:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AB210E6C3;
	Thu, 20 Nov 2025 01:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Iqizuyol";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3844410E6C3;
 Thu, 20 Nov 2025 01:45:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSM0Ol7Op7DqBFmZcz2UWOlLIeVZ0NEV3EG+lUJoSJtZ7M7yhL0hPyf6nF/fyMe0GgjubomhawaXzqzSsyY/Gw/4BAOrfTHmgiLlIAvyGh79LtXP3wWlmuQgVcDkhtSF9xmj6S0/CBBXv5kwc1rbp9d+rDdes5cSedgwjCJwdTWH/vkNDWCIBW193n9dJsBlC+hLXmvkN1X4BraRONTqQX2q+sUuMB5oR6X7Q7xUobEy1Ue63fIHL+S9GHJZsGM7DD4ln387vemxog+pyo8Y53a6KvsMGugXmaD/a6OS9EwRJiBJov944EpaC2NFzskWFwj5ou6qybKcqWgh6IdSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L6zVMcyv0wMoYhG+4DQJVwhJgG6oNCPX/nOhrEi5KE=;
 b=nniodra+q78LqY5q1FNfQPD3bnZO4ipPSfllYAZKcNAt0DLDHmAvQnsUp7XibVoaHIMc8q/rfK6bBZeTkRRmj14ZuIRbz6dtDgtm2symUa9JwQRCf2T+MXJHHWHczhD4vovB3HHCPqedTL/cbD5xupxiXdr6NEDqpEsG1w+5Afxo7TSkVJsFpG260gpbeAeUm5nH431Jlq+0MMDuKHxpp7XSePM3/W4WV4DCGl2EZ14pvRm2FEhq0Ssx0arjqWE1xOyuKsiiDK1jvXArdW/FgSYfwzLJ9UljnqzJAH1WAqI9h615vpC34sSZekWFbbQ/lMcvvDLvbXpNA9D9iOz8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L6zVMcyv0wMoYhG+4DQJVwhJgG6oNCPX/nOhrEi5KE=;
 b=Iqizuyol9neVRte/PgagsP7VeJTR0Xggm+KoNU/D6vOGmVNCwm1doFR1TSSVd4CoxQwZo6DAuj5CEXRNj0Td8MWZYg7Y8nT6utmENlhxz7itQqCsZ6BIyyQGGLIk5KkYxfHtPS1Y8ScqgszBlNhXkD05MWRxIOfTX+hNpE7Maz4v1zM0wQdOQR0dDXESIrVhEq9Gc0PWd8jq4oAOnvwAjGCuekK5X/JrGQ6uqkSAYIKtSMBnQuwNDvrHDywOssqAhLgtWNAi3m3pI34n9Zkhykwwqq75wd4vmXayUhrDIVsbg2AE0N4tdlhMfFbrPZ9yNo7HEDKutRsZsDvDsZ4Vhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV0PR12MB999092.namprd12.prod.outlook.com (2603:10b6:408:32e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 01:45:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 01:45:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Nov 2025 10:45:23 +0900
Message-Id: <DED54Q5P8VGD.1QAL7L2J6DCAT@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
 <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
 <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
In-Reply-To: <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV0PR12MB999092:EE_
X-MS-Office365-Filtering-Correlation-Id: aed23ef0-fb70-4a70-b946-08de27d67a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFBqNGJ4Q01OTzB1UkxWR1JMMXlSb2FiMXMyVEV1ZDBxREY5NGIycTlZWmpD?=
 =?utf-8?B?cXhrNFVxeU5WcWpzdk43d29KR0llNFR2RkxhVGNjTUtTZmFLSEQxR2RBRTFG?=
 =?utf-8?B?VnFYVTlCaFRGZnIvM29iK3JrVWVyNGNrTnZnYkRHWFdycVRFRVA5VExCa2VJ?=
 =?utf-8?B?Qk9NRzJUZ2RKaG95dmRNMG9zRW1kRXZNUTgzUzYvZ0lNVDg3dnZES1Nlakxn?=
 =?utf-8?B?Q084RnhZbG9Vb1RRdloyZndnbWZ1dTMvT2xITkZNSDYzTU5lM21nclNNYjky?=
 =?utf-8?B?K2hxTTJYVnpxazdYUnVqMyt2TFJDTXdDb3U0RGMvc3BnbEQ0eFdNSVd3T2JG?=
 =?utf-8?B?TWF3Ti9HOEx2NHpJM2dMSVdOV09Mam51QlJjd0l3Y2VaVFhZc1pmbTlKUzNG?=
 =?utf-8?B?dTBFc1A1bmlha0x0WlppVndtYjZmdkZiTnUwSGk4UnJuZTcrbEhXZ1VXR05I?=
 =?utf-8?B?aU9VY2pNZk5Qc2lZelhiU2c0dWZQRFFQbGJyeVF3UVZNNDFUWlh6d2xIYW1Z?=
 =?utf-8?B?dENrZDJ2YTZIZldiTC9QMU9tUExqdjJqTStmd01mQmdxSjNmOENIdEZ6ek83?=
 =?utf-8?B?OFVvVFdVKzdOQjc5MWVnL3FkTkpRTWdWSktRc2JHVmJ3NUlNMnI1c2prOU1m?=
 =?utf-8?B?QjlIeTZPSlJlTVIyWktySEZ3QWQwMHVxUXV6Mkh4SzZOVlZ1c294TGJRaFYr?=
 =?utf-8?B?K3pXNFRMbmZMemhxUm0wUzJ0UkIvaklhQm5zWGNxMjBHanhxTUhBblk4Y1px?=
 =?utf-8?B?V2NpNk1LU1pyVXduM1M0NVE0clhxa1o3QmZGRFBYVmtIQmhVMnhVUEpkeXlL?=
 =?utf-8?B?T0xHTVJkSTlndUllZTY2Q2tQQkk4R3crM0FnMmxQWWZEc3lNZFVrTnBIWDhX?=
 =?utf-8?B?aUlZek5LVHZTZ2dLWURyWUhqNlV2RlpQdVljWkxFeFlGcC9uYmROR1JYR2di?=
 =?utf-8?B?aE00L0IzdEc3cDh1TFc2NGlJaDl2N3k5US9vRnVLWjZMOXdUSU5GaHJRT00v?=
 =?utf-8?B?WmxiaVJWRHdKaGN2WXlSYjN1aGZTazhOTkp0clBjSGFNQjRGb0RVZGRDWkVW?=
 =?utf-8?B?VWpRMnNhY0kwVXhuZUlicFJFWDJGT0UzQnFuYzJ3RDFLTC9NNkN2eUcrVFpY?=
 =?utf-8?B?ZEFzanV3SUhOTlNVQktJMEFSZWU0clJ6b0ltZE14YmRub3pTWE5kbm9mQlFF?=
 =?utf-8?B?TXd6NzdEeVVPT3JJbCt6VlphM0N0aHBZWEtXbFI3UHBxYzN3L0JEejlMM2ZD?=
 =?utf-8?B?N1lVV0pzQis0Nlo3d1ozdE81ZFg4cWdBZWQ3amJkV0NCM2xRQUU3QS95ZW5Z?=
 =?utf-8?B?YnNCSEFQLytvWFZQaWlMSjdZMXh5NE13VGI5dExLczZ0dkRXT2orWHliZGlC?=
 =?utf-8?B?bWFrQWoxZDBONlJlWkJoYjJGbFlxVjNFbWJBRU12Y0c3YmdOdGUwNGlGRjlo?=
 =?utf-8?B?UGVtdTVxS0lVNEFoQUxpeHg3STg5RE1FMzRJR0c3TmsrcUFoblZhWHJGdE5N?=
 =?utf-8?B?SklWNHpHU3NBQS9CRmY5WjVXbDNoN1V0a3hOYlhPNmgySitYZURYL2lLcDh5?=
 =?utf-8?B?dFNQRkhQcFFOVklvZ1A4K1lmNlFBLzRodTJJbVI5Mnc5WklYSUNrMzk0WlVa?=
 =?utf-8?B?bWIxZVQ5RmkycnErWndmbEZmMmFSblpWTzRXUkNjN1lQUlBja2d4UXJQM21G?=
 =?utf-8?B?SDRLUnk5WGZsVGpnSG9vSjlERGJUUEpabm1TUnRpUzVRUVFUTlZ0YS9YWUxI?=
 =?utf-8?B?YjRRdWlISWFoSmxqS0RHS290ajZZclRsWWpRMnZCNVBkaWF3c0k5bEtnQ05D?=
 =?utf-8?B?VWJ0REw2a0VXNEYwQVVhMDN6SlVDeE1jNVR5MDlmTkdMbFZlbmp3RHc3ZlFa?=
 =?utf-8?B?T1paemExSkhOTVZFYlY1MUU3TjVyQWo3R3BzdEFaRlBHY08rQUJobG9sYzdU?=
 =?utf-8?Q?H4V30O4iVZ6CS1o72wJX0bBeGJ9on1C7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YytmK2N4d2F3d1dnbDBFVjkybzQwa0xBaXJSY28rNVpRUlRrdUIyeVNkeVNs?=
 =?utf-8?B?dFVwMjYwTU9MTEJzYmJOeGVqbEErZWd4WHN0Q2Y1K1dpQmNRZmV1UXFYbXhT?=
 =?utf-8?B?bUgrcmJjek9ZRWJzL1RhZnp2SnQySElGT050T2VmQXpLc1hzcnpPcjZ3bE5h?=
 =?utf-8?B?UFNTWFNKdVRLY0Zucjl1dkJkZkhMWUsrN1Q5NmV3bFlyUElBQzVFNTZvRnY1?=
 =?utf-8?B?cVBTZWtrWmZQTXU4amYrdWdEQkFHbDFTeWJiSnFpWFBSRlltbHRCaFZUOXpX?=
 =?utf-8?B?VjhlU0JhNy9kZUxuMGg0T0FQSGtCRlk3bXh5cUZNSVNIMDUvRDdNUWtacDQy?=
 =?utf-8?B?bm1wbmFEcmFISkIvdnJPS0w1Nzg1NWw5ZXA1ZTVtb1VNS2FwZVB4NUFRTHMr?=
 =?utf-8?B?YkdSMFNWelBRSGc5WUpzUW5ZdmNVeEEzSjBwcE0rR3FpZ0ROOHBJZnVBMTgr?=
 =?utf-8?B?eFhpcmQ0N2dqYUtIQVY2aldZZ3VqRWNybDRRQjFFYnROaWpBdm5VTVdVN0Rm?=
 =?utf-8?B?bVRzVGVBZUNHS21HMXRLTjNKTFVFeGFiMVNKdlRMRzBaN3hMeXl4MDQwRDd5?=
 =?utf-8?B?ODJLSUhlcWhBSWlSanFBZzk4aDVFRVFGWStoMFlKZEtMUmN5L3ZQZEwyUnpU?=
 =?utf-8?B?QjNtcTkydUNpYnptVWdqSW1KSHNaVXFuRnRQb1M3QncrbnZ1Ly9NNXVGNDVM?=
 =?utf-8?B?S3o1ZkVwMmJaVURHVWxkYm95WHRJN2hTc3F2VDFqYkF1ZEFhNHB5UGxwc0dR?=
 =?utf-8?B?OGNEc2xBZjloUHc0bHFtMjZaZVRJVDJWQTQxVHQyb05PTC8wOVdQMHRTYmhs?=
 =?utf-8?B?Um1VSTZMUUVUdDEzTnpaWTBwVlN4SXUyTUpIT1R3SlVBZXN6WXV6MnNwenMz?=
 =?utf-8?B?WlFwSFY0OUpueTlUMUZCL3hCQlpmZ0l3QkpCTE9TUVVvVHFVRVRXSDRzLzh5?=
 =?utf-8?B?eDhWVXhLQXJuR1h4Zkx0UDk5eTdsT3AzQjYySUN3SEpXWmRMY3NIYVdoRXRv?=
 =?utf-8?B?cGhWdk1XMDQxdmFYM0tUUlQrTjJoSXE5MXlnUnVCaTgxVksweFBUSkZ4YmVZ?=
 =?utf-8?B?VzB4SnpFYWRGL1IxNUVmU0l1QzM2OWVBYW1GVUNuVmloU3p6eFl6RHB5QmVP?=
 =?utf-8?B?aGxXbUZHSllQOGROSzQ4WW5ZTlJhNXlkaG03bkR5VHBvMlB2SkQvNFNCblZ4?=
 =?utf-8?B?d3ZPeXluNjVSWmJYQWttYlQ4RWRtMW9kQjRmcklyT1R5TVFiV09aemlGN1hG?=
 =?utf-8?B?OHA3dUFZSUpsY2ZOaU5zWWlUTDFENFRBeFhkZ25tTDUzNHdsYXNiYUdsZFhI?=
 =?utf-8?B?ejJUTlROZStJbk5CRlA1TG5UQnFLQXRPWEN3TjFxOUdEazRPa2JDbmZmbXRB?=
 =?utf-8?B?ZGpMamRhZG03M2Ywb2NNRk9SaDNkNGNvTktpa09Ga1F5anJoejFzeFZjZXFx?=
 =?utf-8?B?UmJrcmU0ekJSREY3dk96YmZzc08rVGhiMitFN3hKbmJPYXBOMFI3RmpNZmpr?=
 =?utf-8?B?SFJaZnpaWE5MSlpJcjhMeHBCYnFZeGFiZWJ2bElmOEtmdHphdkhEKzhyanR5?=
 =?utf-8?B?d3JoN08ydXJJT2Qvbjc3VlZjaC9tZ2RTdmUxa2ovZzllYytJQzZQNFJVd0Yx?=
 =?utf-8?B?ZnBjclZjejQyVmdQb0plK0dwdlJtN1BVL2dxNGhza1l3K1pYbGJMc0dZQlMx?=
 =?utf-8?B?TjdBQS83UCtaSnlReUE5a2QzdlNhSG4vbGJObVJFeElrN296UU5VRUdrTFdH?=
 =?utf-8?B?bkxvSGkySHpEaHFFZTZuckFGcFdKWkpxY0VlUjIyVS81UElXMmU1NUdWNlho?=
 =?utf-8?B?WXExZ3FLRUt6TTg4dDhaN0tUZmxxWDNpcVVYNWtRbXB5L3NQMktVL2M2MWlY?=
 =?utf-8?B?MGFPdlNEaFFUakZPcTJnVFdTc254MjdXbHVLdFZUTHJIRGNyVUg5U01vM2VL?=
 =?utf-8?B?RlFMY0laR2NhYUREeHlVR2ovbTJLSlQxKzk5R3lXZWs5dTgzRUp2TC9FTmo3?=
 =?utf-8?B?UytTOU9pMmp1UnVKbzFacjdZcExiaFJ1NmFCSVhiVzlaaS9aNXlVdUd2UUZS?=
 =?utf-8?B?dXA2UVZjTUdCbVZYNVBFM3V5ZWMyMTV1dWx4cGJVUkdnVWVqVFhQdFdQdm9q?=
 =?utf-8?B?Q0dPQm96emhsWm56bmYyQnA5SlpLcGlVMjVaZ1lzUEU2QzArTDhMekFqb3dU?=
 =?utf-8?Q?3IOCdrAo560zcgWHoyX0cklPl9ctMHBMDqsl1WimWFpJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed23ef0-fb70-4a70-b946-08de27d67a86
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 01:45:26.6884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9Xg4ZVw6fbxXhleT0soIm20R/5ncHLfdjNLaH/8laa3hRz6AQ7fSZA3M4kGGgRCbSwftzmhyX6O3FaeHE1IvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999092
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

On Thu Nov 20, 2025 at 4:54 AM JST, Timur Tabi wrote:
> On Wed, 2025-11-19 at 15:55 +0900, Alexandre Courbot wrote:
>> On Wed Nov 19, 2025 at 3:30 PM JST, John Hubbard wrote:
>> > On 11/18/25 5:54 PM, Alexandre Courbot wrote:
>> > > On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>> > > > The GSP booter firmware in Turing and GA100 includes a third memor=
y
>> > > > section called ImemNs, which is non-secure IMEM.=C2=A0 This sectio=
n must
>> > > > be loaded separately from DMEM and secure IMEM, but only if it
>> > > > actually exists.
>> > > >=20
>> > > > Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> > > > ---
>> > > > =C2=A0 drivers/gpu/nova-core/falcon.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 ++++++++++++++++--
>> > > > =C2=A0 drivers/gpu/nova-core/firmware/booter.rs |=C2=A0 9 ++++++++=
+
>> > > > =C2=A0 drivers/gpu/nova-core/firmware/fwsec.rs=C2=A0 |=C2=A0 5 +++=
++
>> > > > =C2=A0 3 files changed, 30 insertions(+), 2 deletions(-)
>> > > >=20
>> > > > diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-co=
re/falcon.rs
>> > > > index 0e0935dbb927..ece8b92a627e 100644
>> > > > --- a/drivers/gpu/nova-core/falcon.rs
>> > > > +++ b/drivers/gpu/nova-core/falcon.rs
>> > > > @@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>> > > > =C2=A0 pub(crate) enum FalconMem {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /// Secure Instruction Memory.
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ImemSec,
>> > > > +=C2=A0=C2=A0=C2=A0 /// Non-Secure Instruction Memory.
>> > > > +=C2=A0=C2=A0=C2=A0 ImemNs,
>> > >=20
>> > > So, seeing how this is taking shape I now think we should just have =
one
>> > > Imem variant:
>> > >=20
>> > > =C2=A0=C2=A0=C2=A0=C2=A0 Imem { secure: bool },
>> >=20
>> > ohhh, boolean args are usually not a good idea, because they make the
>> > callsite non-self-documenting.
>> >=20
>> > That's also true even in magical languages such as Rust. :)
>>=20
>> I fully agree; that's why I made the field named so its name needs to be
>> specified every time. :) Maybe `is_secure` would have been better
>> though.
>>=20
>> >=20
>> > Let's prefer enum args over bools, generally, please. So for example
>> > (there are other ways to structure things, and this is just the
>> > enum aspect of it):
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0 enum ImemSecurity {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Secure,
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NonSecure,
>> > =C2=A0=C2=A0=C2=A0=C2=A0 }
>> >=20
>> > =C2=A0=C2=A0=C2=A0 Imem { security: ImemSecurity },
>>=20
>> That would change
>>=20
>> =C2=A0=C2=A0=C2=A0 FalconMem::Imem { secure: true }
>>=20
>> into
>>=20
>> =C2=A0=C2=A0=C2=A0 FalconMem::Imem {security: ImemSecurity::Secure }
>>=20
>> If we want to use an enum I think we can remove the name:
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0 Imem(ImemSecurity),
>>=20
>> So we can specify `Imem` as
>>=20
>> =C2=A0=C2=A0=C2=A0 FalconMem::Imem(ImemSecurity::Secure)
>>=20
>> which is as explicit, and a bit shorter.
>
> I fail to see how any of this is an improvement.

It lets you capture both `Imem` variants with a single match arm instead
of having to remember to use `|`, a pattern that is common in this
series.
