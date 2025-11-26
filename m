Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC89C89FCC
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 14:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C56B10E5EC;
	Wed, 26 Nov 2025 13:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2mT1Wyw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E9210E5F4;
 Wed, 26 Nov 2025 13:22:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoIsIBp7V+R9s1mtbzBtshKPSX2h73fRBpFyixiHcfFDXhRppVbrO/hQ3Etj76whlT1cCJKlc+5+G8nu5EOK7+sH1bBFrYvuSu41JVyqK2nNR0rOlxasVxbnoDRe6M9zWP/ZxOmDBTKcRkFCr/jrm31tJVt5gXGoGzH+DQ/PT84bNRDiX2jcUz7BvOd0KPHLK7rs0rWugebwd0a6X/2zeEkE49XviGy2EX5U0ICS8NjuvdsjlDSJrTeh0bffpkKUvKYbfil83liEwxpXRhl8OLmyp8+aG23AiZCS0DTZugFEwhwM8XbRMPr33g9Bg5eb7MZr13qJdu309dlFi9oECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh4vclAmw6RUzUSXNMq4klqrNbdMeE0n8vQwEff6XKA=;
 b=DPs3E1vfc17+C6YSxdKJS4jZRmE/9WFWOPfE9KDGpSLPamQ7S6fZT/QZh/d/HGmzYS5M1EZB2NcjCDFU+IPSHmnI+Z3PCIJZdtuaXTAKuMhGj/3VlifmMNl8R6Cp2Dhy3d1xLmwU6NMgjS/qzEP1QMKGioElTZcf+59fqs+kCFrp9XbVm33krkfTAm4JC7/s8aambyin9O5gtRyEFSPVyIlJ0RXvE2S2aSxd8mk4K7bQ6CADIzh7P2BKS5NWIiXjQ7eS0zhb9Aqo+dWZPWEcuT/cjDGgmdLlzp/xiVq2E1aIxgUdFzgnigm8ioeKMDAF8jQhWBWoEivG/ragU9VLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vh4vclAmw6RUzUSXNMq4klqrNbdMeE0n8vQwEff6XKA=;
 b=H2mT1Wyw5qCI5m+R7Y1GXyAOTnQqSmi3XWm7KsaG71Z2A2g6p4CEdO7CBIbEbSPvDbUltGHlIf3JOEXzvEPv4YUA6mbyjVreEWZGySjawNRHpUVK4h5bryXX4ijHnY8U3YvegBlu2gE+H3ElPXN2RqWTa29nNLmS4cXwSDddXc1bfcgEL+fFEdQ1lPIZIkkIp1HJH8WhF0+sfDxNH8u+dw3LUxAqeaY/0s7LZX1ZHCIt6y8rhMM1aUT2XNoSnUeZ3OfxZiqj6c5h4zvucf95wHHA18Si+PSnDfUPxz4cMjLx50TH8KeVXpDAqfKKk4tGdZ9XCqoZckZvN0p4RR5Pkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9676.namprd12.prod.outlook.com (2603:10b6:930:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 13:22:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 13:22:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 22:22:14 +0900
Message-Id: <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com>
Cc: <bshephar@bne-home.net>, <dakr@kernel.org>, <joelagnelf@nvidia.com>,
 <jhubbard@nvidia.com>, <airlied@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <brendan.shephard@gmail.com>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
 <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com> <aSbOWhKIpCBm0NKL@google.com>
In-Reply-To: <aSbOWhKIpCBm0NKL@google.com>
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 732e12fb-0d9e-4604-5559-08de2ceed219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Si8xZVBLMzAzcTNNcTh3Q3ZzY0cvN2pVY0VBZDBtZndpTXNxWkZBSytVOHor?=
 =?utf-8?B?QUxUL2wxd21FMkJ5V0NwaTdQV0xsK25ZSXVrTjZFdEFORGZoWGoxREN1N0E1?=
 =?utf-8?B?YmtIVjJNcXkwbm52SVNZcm5CV0JqL3o4cEI3NWNDN2ptK3BGK1Ywd2pHekRp?=
 =?utf-8?B?TnRaYWhLT0RSdVAzTmV2dVU5eEJpRnZlQzRZSHlieThSaGRSUk5nREpLb3lO?=
 =?utf-8?B?T3VOZzRrUlBmcGptMERNWVBpT3RPZE42YXYvN2Npd0pKQ2grblRTOHRuNEhN?=
 =?utf-8?B?bDRUY0JmWVlKSGJ0SjNjei9OalArV2loc2pkVDhabG5udUQxWjVuZ05tWDR3?=
 =?utf-8?B?dXhwTGtVL0w3UE5BOE5UL3l3T28rYzJEcWJiRXZwd1c4eWtLM2paS1B5NTJu?=
 =?utf-8?B?akVKL3o5bFFQR1ltMU9ZenBOMEQydzJ4bGpPYzRZTUJXUE5KTHprMndmM3lH?=
 =?utf-8?B?eDJPUzdnOHNDWW0wQ245UDU2MkZrQlhUYWpBbDNKVGx3T21PUmhpTmp6Tk5R?=
 =?utf-8?B?VjlCeUl6bFlqRGpDcnR1cWdyQmdoVHJaTWMzTnFqbWxsZFVLSUxpcllxcU51?=
 =?utf-8?B?d0pPTFpmSUw3ZkpIZzQ3N2FGSDJjclRCamxJeW9iZkIwUnlUQjVvbUc4dzl3?=
 =?utf-8?B?Wjc3MDhlSFc5VGJEeUpOT0JaTmFNa1pGL29oK3gwK2ZHWC9nMWQvc1dpVzFP?=
 =?utf-8?B?WUU5YnZsb1FpbjNvRGtnZHZzY2s4REl1YS81YjBQcFU0TXRXelZKZStQNVpz?=
 =?utf-8?B?d09lQ0tBZDhodG5hU1N0aHdQRzkrdDU0MVhkUmxJektLYzFmdWg4R3FqT3dO?=
 =?utf-8?B?NUpUcnRMelIzbUN3T0VjNFd1YTlPR1dDZGNTZWo1MjdxbGN4eWtHQWdKeTRG?=
 =?utf-8?B?V0oyTS9Ca0xFK2JCajl2K3N1dkdDWUhaSWs2TENVTHRad1VSblE1OEVwenRR?=
 =?utf-8?B?V0d3dlNSbUZsd3A4aHd6TUJjWGJpK1pWTys2dDlSYnNkUndNNENaU0RrNmxY?=
 =?utf-8?B?aEdYWlpDSWUzK1N6NDZOcGtCZmJmTEZTdkhSQ0ZhbTFHM1NsbVVVOVRUWmZK?=
 =?utf-8?B?UW1XemFBK2M4Z0tQcXVYUlRYTkN5VFlNTkhQSzJEcjlWQzBoRmFFTGdSV2xJ?=
 =?utf-8?B?TnRHcjZNb2pFNUZJb1RIYkhoOGQvS0xWTWNSTjY4d2pUK1IwN25TaERsYklG?=
 =?utf-8?B?R0RsWmQxTTl0R0UyYUtpdFRORkFVKzdaTWJtVE5pMWhhZWVnN3FmSTVhbWdX?=
 =?utf-8?B?L1VYWlI3TG14dDRJN1dQSU9ON2RjZmtTKzl1U0ZkU3FjRkpSenJZWGZSYkUw?=
 =?utf-8?B?Q21HalZKNFBOOXF1Y29zVnJ4YUlGdGM3dUV2VHRsL3VpY29xRytCa3htMHZH?=
 =?utf-8?B?NUtIVE5GVVZ1NzJkWjZmQkZVWHZsVjREbUVZOFlzN2pWQ2xzSXNnZGI2d2FE?=
 =?utf-8?B?QkcrVTJIT01SYjRTc3lNc3RHSTBGa1RtWlEzZ1JuUjBJYzVKVjlUSWpKSEpt?=
 =?utf-8?B?dE9TSE5QNldkZEg0WENXby9LdHlIU3doakk3em01aVZteWNUVG5wWHlHaUth?=
 =?utf-8?B?ejBEU2t1elREK1FDQUF2dVBTU0ozMUw5V0g4RmdsMWJzQWtPZy9oZFpFNW5y?=
 =?utf-8?B?aTFDWWc0cGltdmJaSVhjdHM4dEsvaXcrSUUxak0vYmc1UEJYdXdGREVNV1dT?=
 =?utf-8?B?ODBWeldwYjJKRGdCcWtibTFDS250dmEwazE0c1lvTzZrdHJFUUEvNzRQTXkz?=
 =?utf-8?B?clpKNERrOUJVMHNWN1BEWTJOTHdqdkNQMC9OTjJnb3k2QThEdUZoTmkxWmtV?=
 =?utf-8?B?QXBvcnkvOGRQY0JVMitidlFtTlZuWndsQVMxa2FVclE0SXZ2Y09GakVHbDFs?=
 =?utf-8?B?MkRnaGpCbDRsN2hLRTZUMFBNRUlxMFduODRDWUhyWVRSdGxnVDZwWGNQS0hH?=
 =?utf-8?Q?pGfMDSCfhi7AxTK6hNwmQ1wal7lAPCfy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djRuQjBIWGVaNTRmditPcWhJOGNWQUlDdzJYZVBYUUFsQ2FOQTZjaFFEQ2NN?=
 =?utf-8?B?WE9iZHV1dTZXejNiRnp3NUppVXpJRkRoWWI3VkpUdHZpZHhwUjBtNUlrNXN3?=
 =?utf-8?B?K2NWdTRDdHVRS2gwMElCcGxpTVVIVVpWRFRuTi92d3B0NjVaOTMyZ1UvMlgw?=
 =?utf-8?B?emI2Tk1TQ3I1WWVQWktEaGFtaXEweUQweWVDR3o3ODFDdjJpbFpCZlc3emlE?=
 =?utf-8?B?dllVR3VaL29uMmdQelZ2RWpWNlFwemJCQ2lhQ1pKR2hmZ2hHZXNCcmVnMk8v?=
 =?utf-8?B?aVNtcXdnVTNzaS9ZWmRWNHhUVGJ0V2ZBQlpSclBxNHJhK05aYXIwaHVibjk4?=
 =?utf-8?B?ZXBUY0lMdUZ5WG9wNFFpczcydDhHNFUwY0RtUU9yOWZGdHk4U3FQakVOM2d6?=
 =?utf-8?B?Mmh1R1hLMk9sbWNxNU9IY09XeklwdEIrbFdIenh0SzlzTS92WTFSckJIdVNx?=
 =?utf-8?B?MG5QRXREL3BpdWZ3ZWdJK2tMQzFsMWttTFpJMC9VWmRXc0ZacmNWdlo0b0V6?=
 =?utf-8?B?eElLNzRid3V4TEdiUWJHZmJTT05BVE94Q0VqQTRuNjhFY3JVeGxCMW10UDJX?=
 =?utf-8?B?RFl0NitpYjJYc2ZvRzg3ZEMzOHpZU0FwMkM1dVkrQ0oyRWMxWHZ1Y05EcFc1?=
 =?utf-8?B?UGJxemhMTEEwT29pdVlGUHJaS3JkYmpaUU05d0c1TEs4dWRjWVQ2SFVjTTI0?=
 =?utf-8?B?dGwyaFlmaVNma2dNa3l0YzZXTUtEdXVWMlExRnhWMCs3WmpxRGU1eThqWlFJ?=
 =?utf-8?B?M0ZzZ3dTTENEY3lXZnNVeWdiUGwzL3RDbjZVV3lmbXNJMkVaVUNuYjIxVk1w?=
 =?utf-8?B?Vlh1bnFEdjV6NGJxbWpidUdtWUUzbnc5TEhidWd4OWo0ODlFNVdYMmJCL3BI?=
 =?utf-8?B?bzMxMStnSjBqakszNWtBRWpqclFsZHdNSXc1aUJMcGNKcnc0d294WFVDWVNM?=
 =?utf-8?B?dUhoUFZId1FBS3dhTnV1WWJnUG1NNHBienFTVVR3anU1UWpweDFZU0J3RDk3?=
 =?utf-8?B?MXlDWHN2T0ZkNEN5T3pGdTZVMFRkcjRjTlp1c0RIemJMWXBVelhkSG9mVmFx?=
 =?utf-8?B?WGg5eVQzR1NWTXM1MEtpNTMxNkdQRmtLVnlWV0RDbDJRRVg3ZW40V2lsTUxE?=
 =?utf-8?B?Z3BvV2cyc0laOFpQY0xpSFRSYytsN241ajdrK0JVUTN6eHBxL0VBd3A5NmQw?=
 =?utf-8?B?YjlXVTR4UXpEUTZQOStRbVlBdnBqWnhhS3MrczZ0TFA1VmNVTTZTT2ZmTkZ5?=
 =?utf-8?B?bVNLR0E1NzlZdVJmSjNndW9ZRW9iVHVlbXBmM2g4VEpoaGY2QmRnT3pLQ0JY?=
 =?utf-8?B?Q2UwbXN0L2g3V2dyOGhmVkRkcVJ5b3VjcVM5VE1wUVJ3NTBzSFFJR2V6eisr?=
 =?utf-8?B?QU1pbUtNQS9wTWJxRzVyeWhTOFpGUGFkbHBKZmVuenpTNUFzaU5QeDJiMndz?=
 =?utf-8?B?eUMxT0RTdDFIRWJvakhpRE5XS0hidi83bW9CUWNqS2xiamNsZVhGMmx1T0pr?=
 =?utf-8?B?cFRZSHM3bk5nbFhndE5sd2dRZURSUmFvUEs2UHVwNko5OVBCVnRJdzBMU3ZP?=
 =?utf-8?B?Rzh5dEg2OG14cXYweXN1b2djWEtlYUVnOXd3SmZOb2s5MkVERlo4TDZyMmRR?=
 =?utf-8?B?ZHEyVGE5ZU90MFJCY1JVMG0vR3FkdVZ3aCtyd0IwTkdzcVBiQUFidGlkVzdL?=
 =?utf-8?B?d2p4U1ZiYy9uRC9xekNQdnJ2NWhqV1VFeEQ2YkFGVVJaR0REQWlNMUxMelRL?=
 =?utf-8?B?bWtyeVJ3Q203QzM5TU5idWVjcU04TjZHc1hLUmtVbjQ2U25lNmN6b1FkblRY?=
 =?utf-8?B?TFhHZ0hzMTMwSk01TCtybHR4RE9EdlZldnNrMWg5S0VkNWZvVkdINVROaDcz?=
 =?utf-8?B?NXd2a2JNZ2lhMHFhWU9TUnRzQnpYZjlPR09rRVNNclhhWjk3TU4vTGxadzlR?=
 =?utf-8?B?c1E4V3VOWVRtMHNob2VsMkxJc0RNdWlqVWFlOU5yMmU2QjF6cjRVSERDZ1R6?=
 =?utf-8?B?YnFWbUxWSTBaTkxuNnl6QXpta0lUYTZpc2MrVXZ5eWxpYXpmZytRd0xUeGcw?=
 =?utf-8?B?Vy9SUCtFeHNVR3FhRWhVZVdTdEJ0eWxHMmQvUHQ2YlJtYzREZ0RUSjluUmpC?=
 =?utf-8?B?YW9NUmFqRkxIanFNd1pxVUZ1MU1rdGJjU3lINC9zeFlZaDI2eEQvKy80UXJs?=
 =?utf-8?Q?RGrSBe03ox4kH+zBaDeTKx8u1HS3J8PblHJ49QAqPZLF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732e12fb-0d9e-4604-5559-08de2ceed219
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:22:18.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuORS5AHfmSh2wgvD7reZaQb0ow4KCHPxD3+/+TbC7jJMLhqWIUa6OQpjOqmXWbhddhguHL5ruPo9gpA3fmjjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9676
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

On Wed Nov 26, 2025 at 6:54 PM JST, Alice Ryhl wrote:
> On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
>> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
>> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@nv=
idia.com> wrote:
>> >>
>> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
>> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot=
@nvidia.com> wrote:
>> >> >>
>> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
>> >> >> > Use page::page_align for GEM object memory allocation to ensure =
the
>> >> >> > allocation is page aligned. This ensures that the allocation is =
page
>> >> >> > aligned with the system in cases where 4096 is not the default.
>> >> >> > For example on 16k or 64k aarch64 systems this allocation should=
 be
>> >> >> > aligned accordingly.
>> >> >> >
>> >> >> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
>> >> >> > ---
>> >> >> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
>> >> >> >  1 file changed, 8 insertions(+), 3 deletions(-)
>> >> >> >
>> >> >> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/=
gem.rs
>> >> >> > index 2760ba4f3450..a07e922e25ef 100644
>> >> >> > --- a/drivers/gpu/drm/nova/gem.rs
>> >> >> > +++ b/drivers/gpu/drm/nova/gem.rs
>> >> >> > @@ -3,6 +3,10 @@
>> >> >> >  use kernel::{
>> >> >> >      drm,
>> >> >> >      drm::{gem, gem::BaseObject},
>> >> >> > +    page::{
>> >> >> > +        page_align,
>> >> >> > +        PAGE_SIZE, //
>> >> >> > +    },
>> >> >> >      prelude::*,
>> >> >> >      sync::aref::ARef,
>> >> >> >  };
>> >> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> i=
mpl PinInit<Self, Error> {
>> >> >> >  impl NovaObject {
>> >> >> >      /// Create a new DRM GEM object.
>> >> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<=
ARef<gem::Object<Self>>> {
>> >> >> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
>> >> >> > -
>> >> >> > -        if size =3D=3D 0 || size > aligned_size {
>> >> >> > +        // Check for 0 size or potential usize overflow before =
calling page_align
>> >> >> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
>> >> >>
>> >> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` -=
 well,
>> >> >> I'll admit it looks better as a placeholder. :) But the actual ali=
gnment
>> >> >> will eventually be provided elsewhere.
>> >> >
>> >> > What about kernels with 16k pages?
>> >>
>> >> The actual alignment should IIUC be a mix of the GPU and kernel's
>> >> requirements (GPU can also use a different page size). So no matter w=
hat
>> >> we pick right now, it won't be great but you are right that PAGE_SIZE
>> >> will at least accomodate the kernel.
>> >
>> > In that case, is PAGE_SIZE not the wrong constant? What's the actually
>> > correct constant here?
>> >
>> >> >> >              return Err(EINVAL);
>> >> >> >          }
>> >> >> >
>> >> >> > +        let aligned_size =3D page_align(size);
>> >> >>
>> >> >> `page_align` won't panic on overflow, but it will still return an
>> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, which le=
t's
>> >> >> you return an error when an overflow occurs.
>> >> >
>> >> > The Rust implementation of page_align() is implemented as (addr +
>> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overfl=
ow
>> >> > if the appropriate config options are enabled.
>> >>
>> >> That's right, I skimmed its code too fast. ^_^; All the more reason t=
o
>> >> use `Alignment`.
>> >
>> > Alignment stores values that are powers of two, not multiples of PAGE_=
SIZE.
>>=20
>> Isn't PAGE_SIZE always a power of two though?
>
> Yes it is. Maybe you can elaborate on how you wanted to use Alignment?
> It sounds like you have something different in mind than what I thought.

I thought we could just do something like this:

    use kernel::ptr::{Alignable, Alignment};

    let aligned_size =3D size
        .align_up(Alignment::new::<PAGE_SIZE>())
        .ok_or(EOVERFLOW)?;

(maybe we could also have that `Alignment<PAGE_SIZE>` stored as a const
in `page.rs` for convenience, as it might be used often)
