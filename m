Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B33CEEF57
	for <lists+nouveau@lfdr.de>; Fri, 02 Jan 2026 17:20:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 277F910E2B1;
	Fri,  2 Jan 2026 16:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=OUTLOOK.FR header.i=@OUTLOOK.FR header.b="A9QA6HR3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9B4EA44C83;
	Fri,  2 Jan 2026 16:12:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767370364;
 b=Ksup/YnRHgA7iTMyuTcErMCO9Y37N6bPtxD2RTY1XHBMnGwc7tNpKfpHjVZclIt4ZyX6W
 RP65QO6+SZFyuYNX7qXF8vgKOW8R292x5FJw0wxm/+/hZvXJG4e3E3HSWf3KQlbUzpNMkG9
 I4+U2tBA0xm+ZSv7Rw0/eh2yqC2nA2wPW8sC+wmFm9hdb5miAbxqqx6GQmzJhHaNPcA5ehY
 ltpRf4Kts2g7iix0sENsPUpa71pyEnTX8d7OhbAiuLc6uuQreXl3M+x8bPg8cnjcIZkN0yq
 xS3Xkf2wUmuUTdRCzME5nXAPBGrwpBN5DAwVO352o2lj8MTt/txwHDD5TDog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767370364; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=g+nwXU+iKN4C5rtwEvL4g94GTocOKZgT+EQPKN4ImUM=;
 b=MPJU6Y9a+2p88NG7oXyInkdphvjrBAO8VyZ/5e3K1FYWvpGGnEp/LpoLZP/Ye1Gr6k0S+
 wd55vFO15FL3KmsNvAwZVq+tKCtCSRrG5bctH2GS9GrKWEpBDtWfVSuSqw5E0O0UKiT7eKn
 Eb+wOZSjoKEJ+zydYQDfUuFmxdnmksmqnlxPpLVGpfS7ntVAKEe9F8cVX19lC6Wz3LzPauh
 L50tSmu3fixH+ZNUDQNtVP90rIr/PfSMXGqMO9Y9rhaicJUG+F3sh9HJy9Hj03uIsmckpTD
 XUPv4FXaPGC09ed+kt93dWAlC0oNWZMEElmcDyxj4y8keTQ/HH7o8+xrhZUQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=OUTLOOK.FR;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=outlook.fr
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=OUTLOOK.FR;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=outlook.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 90480422CF
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 22:55:17 +0000 (UTC)
Received: from WA2P291CU004.outbound.protection.outlook.com
 (mail-polandcentralazolkn19012061.outbound.protection.outlook.com
 [52.103.53.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E52B710E040
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 23:03:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/qQIYaN4d0xwa94+yWdCkHzDv8zt+RKTHjfyPygJuAMUeyG8cakKxYFlTUZS30oVR36W39xaJLNhYQOUu9xxW1Z6SaJjVPTMKemvN37iFtOiCVAQBergNTL2DWG/63jsalnYgReVqFUlVeaMlbB70lxYEJoR0ZIy/EEdtB0ynzoPWRl9EzN7UHnSYY9ElaSM2I1gkP7nYRzZWieurbcCT5IklpDRw/dTRecytoFh0DbI2dFE9jMqeT9iOrOj7zuAFq3+ombAt6rEGHL8hDvg77u7ppID7HDD/TNQPQf7A3oZs9VrwGkkGsmukZWXiLBOsmbWORzfCYfiuWx8J9aGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+nwXU+iKN4C5rtwEvL4g94GTocOKZgT+EQPKN4ImUM=;
 b=EiIEeUja6loilpSxUnfyF8yRMgnVyC15R1RafFpYyCrJbHWMz7QBpoHMBgtEMR2PI05sgKP3DawQlDXwog0Atix3BMG+KNEhjOOzQd/5hx9BlMRN2JSwHb1RXkRz1Q723qWydNm1v9Go3t+5XpiebwEymIyXEPFh1qqyifuvVDAOM0k6xFwefXiTaZRjOWsmtwmVoNgo06cMUxFlUPPNOoS9rGSiS0nlsIv9LqeeiuJDq7gL9ihcXzZRwXGCi+whXe9oy4e32hxwpFl+8D0yloD0tkHLINJYmtrEH6xibgsquRBoOjrY4MAlVvMJuSZ4pot1sNOEv5gxK4X+1QFEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.FR;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+nwXU+iKN4C5rtwEvL4g94GTocOKZgT+EQPKN4ImUM=;
 b=A9QA6HR3gaOpt6oZyejENvIwxk+6oh6pLADTxoj7dx6itBS/K8/ItD1KTzi9X7P1/5KmACwzuWBxgvRrJyR7NSLCOuHBs6YAImmaWyZ1AxDH6BmscLJr5Nxhdq3rtHbX1207Dwa14MNWQ9Z3pREZ7Oduj1imd+6eu8AgZ82b0HyAlcs69Jj/a7myOLLYgTe1jkuKDD14bmRL+6IFDGwxvb0rdO+ikV9nNEM3PY5Er/IdzLMvaKDfaq1BbOxtXB00TwsYQVICT2KRKqY0iQymXSjH9ajF8Gf0R/+D6LAGf8uRDy22Z375YHnlIJsL+L7suFQrrUAalzvOBanHnAJE8Q==
Received: from WA0P291MB0534.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:f::18) by
 WA1P291MB0157.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:2::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Thu, 1 Jan 2026 23:03:17 +0000
Received: from WA0P291MB0534.POLP291.PROD.OUTLOOK.COM
 ([fe80::534c:94e0:1a59:bb25]) by WA0P291MB0534.POLP291.PROD.OUTLOOK.COM
 ([fe80::534c:94e0:1a59:bb25%5]) with mapi id 15.20.9456.008; Thu, 1 Jan 2026
 23:03:16 +0000
Message-ID: 
 <WA0P291MB0534F18AEECAFFD1FA83F23C8DBAA@WA0P291MB0534.POLP291.PROD.OUTLOOK.COM>
Date: Fri, 2 Jan 2026 00:03:01 +0100
User-Agent: Mozilla Thunderbird
To: nouveau@lists.freedesktop.org
Content-Language: en-US
From: C D <clement.dallasenn@outlook.fr>
Subject: Pascal Gpu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAYP264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::8) To WA0P291MB0534.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:f::18)
X-Microsoft-Original-Message-ID: 
 <df729813-7048-4a83-9025-ad7104ab9d67@outlook.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0534:EE_|WA1P291MB0157:EE_
X-MS-Office365-Filtering-Correlation-Id: 59748a75-a378-4edc-5deb-08de4989f28d
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|6090799003|20031999003|39105399006|5072599009|15080799012|19110799012|23021999003|55001999003|8060799015|3412199025|440099028|4302099013|10035399007|40105399003|26104999006|1602099012|56899033;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bXNHM0pKUFVwd043LzFSYmthTGt2T2JOajhEU3VIY1lHTVl4UmF6dFFCT3d1?=
 =?utf-8?B?TkRxbHo0TlBXVTZjRlpDLyt1YW1WZC9mMEFWeVF6NmxkWXRYRjJBZGFpVWJU?=
 =?utf-8?B?alBxd3JWTFJ6MEY2OWYvWk5GUlhmUjBJbGxjZk1rTU9GTmRJQ2NBalFzdXVV?=
 =?utf-8?B?QzUvUDhtYUNpdDl0dFMzbWs5Sy90WFkva1RvWEtJcTIycXJlbnNmVEtsZmV1?=
 =?utf-8?B?S2crZHFwcmVZVnpGY1B0WTcvMXorWDREYVlsSHFobEtaMGRJQkRWNVJtZk5E?=
 =?utf-8?B?R0tna0ltU25ZL0FlQXpObkRUOWZGQkIvYWlyS1o0V2lIV0hoOEtGSStVK1JG?=
 =?utf-8?B?Q2NBMjN2WlM0VDFVUHoxczNyb1JwZWlSblZtM0lsREtZNUQ1OVBMTTMwRnJp?=
 =?utf-8?B?OVpIZTVDTkhUSjhuZW9DVk5iUDVnSExpQmdJUjEwTDAzdnJmT05GK1VwWThw?=
 =?utf-8?B?S0J1cmhQMzYrZ1MvWHErNlZ4NHUwbzVpOUNDay9wYnlNY1JOd2d6QUJmUklW?=
 =?utf-8?B?QkRXU0E3aU9sa0xVTlpzNWtoV1FUTTZNTFRnV08zVWZ1V1Vrb1FwdDMzSzdU?=
 =?utf-8?B?U08xZ0VvbDFEdXk2ZlZEODVIbzBhUFZuOVZCK1pETkhDcEp3NHhSeHBVeTlD?=
 =?utf-8?B?RDJSb1dMMVgxWjI0cWFkdmIyVWdGdVdLSCtVa0Vibm5ITTIxU0E1MldmWEpE?=
 =?utf-8?B?OEhiMldob1dUWnNsM0RLT0Z3Q1NKRHFtaG8yNGdORmdOclRxd3ZuRFBDcmRv?=
 =?utf-8?B?WmtvT3R4d2VoRTIwUDg4SWQzdDNvN0c0b0ZjNFJxTjdJaG8xQm45T2RURGJN?=
 =?utf-8?B?SzZLeWJoU3laYksrWlR1bVUzbGc4aFljaEVvanU5eTJSWDRPeDdoN0NZbnJz?=
 =?utf-8?B?MXdRUXc2MUFHZDNVbVQ1ZVBOVnQ0cTgxSHVoMDJqRE52NklHTFRGc1hLaVRl?=
 =?utf-8?B?OGZISzdSYU1QTmhZMGkvQnhXV0JHWUJ0dm14SUZjNmRMK21jTTQrQnhncHN2?=
 =?utf-8?B?a2dDVWhYUngyTW1mSmxWaVFTVzNCbUo4cE4vVGJXVW5pczNYbFYra3FuSDVx?=
 =?utf-8?B?WWRLVktoMEtBNExCNm9vcEJXV2xNc1VhK0pCRnBCTEE1SVd5TVdvdUtiUUdK?=
 =?utf-8?B?UUJCOGxrY005OXlQR09rOE9WNm85SlRXUS9GeXVvUmN5UHVjQ0daaWpwemtB?=
 =?utf-8?B?WWQzSXhnYm5QYys1aU9LTHhQWjRtSXh2UzB0QmsxbDh2M2pDKzlQdGkrM1lS?=
 =?utf-8?B?NzI1Q0YzazQ0TTJkV3oxM2dTKzdvbXc2L01hRmRuQS9LbDV5amdNT3NIa3BF?=
 =?utf-8?B?NG5CRWtXZWY3R2NuVEZnTEIxL1lYTDRrbVVNQjcwVksxZTY3bElwOVhxbzVZ?=
 =?utf-8?B?NE1HMmJtQUpJRktjSEhJNFFOMFkvUTA3Y1JML1VrTTVsd2pPdTVtTy8vOGxU?=
 =?utf-8?B?WnhJdjhwT3FZbXlYT2hVbDBBc3ZUWWdUM29DQlNTdXJsS3NvemJxOW5yaXIy?=
 =?utf-8?B?VFVOMy9QRGg0aTBLUHNBTmJwdXBSSTh3N2J0T1g3QzV0UVlJckJzdkpEenla?=
 =?utf-8?B?Qk11K01pdFhXQ3Ntc09lQlVvd0c5STBlUlF2WVppZDk5TzlSS3dtaFp6bHNE?=
 =?utf-8?B?MTVRQkdwb2YzaVU3cmdXYjllSXp6Rm1vQ0prQ2pnNk1BaXRNOC9XNjhkRUV3?=
 =?utf-8?B?OVZwcFBjdnVZYnVwb1RBSkFhYjNHelNrQlVBTFQ4ZldscVFJZ0RoZFo4b1BN?=
 =?utf-8?B?SE1IcGUzRHpaNElhbkxjVGtmVlZSSHhmWjZQZFEveEFWVHJWYWZiRW9YaWxz?=
 =?utf-8?B?RUpDeUUwbC81ZnpKSmdGbHFyQXJsei84N2hkQ1czdG5JdEtzTnVBTm5TaFhn?=
 =?utf-8?Q?Ice3s7gxTqp6c?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWhxSG9GM2UrNzhHMDNhNXlWRTBNWDNVaFV1cCs4ejFoQ3ZQR2FDNE9IS3RB?=
 =?utf-8?B?c1RsU3NLV25DdFZIRWxhS1BnckYyYmdyc1d0bmNqR0RtNG5ZVFRPZTYrZkZR?=
 =?utf-8?B?NjRQaXI4c3FpMUhJT3czOWFFM2tiQWkvanJUKy9hciszaVZFT29oTGw3ZEZR?=
 =?utf-8?B?TmZqUURxRGY0UGNHcjVIb0xCQVBsQ0V5K2pUOTk1YkFZMFlxNy9JbEczTUhC?=
 =?utf-8?B?ZWFJc2haRE93UFNhVUVHdU1udkZPYzhwRk55clVvbHVZSHpBUGVWOWR2UWhS?=
 =?utf-8?B?L0tVZm82TzdpVHpiWUxxSVMrblFCaXVtbE4vZ0F1akpqQ0hoZnRkL1ZjWFNJ?=
 =?utf-8?B?Wnl5UG1vRUhHSkdDejUwMVhzQjVXc3d5L2hrVFFpdnhEeVdkek82aEtxaXFl?=
 =?utf-8?B?R3JOb1BKeVJvQkE0S3loSi9LbXpZK25FTStCSzZSdm9HYmlQQUUrZFBVTlBh?=
 =?utf-8?B?VmVPemcwNDZJVkVVV0xVbStKaHZVaWRxUE9EZTVMMFZqWFV5dFllSkgxVmlo?=
 =?utf-8?B?UXpWQTFmb2cya0tMOEtjcDVQWU5LQUlTT0NJY3hiTnQrSkx6aUZtak4rcjQ3?=
 =?utf-8?B?SWNKaGVjUGtJTFFWRWVnZlZaQ1dVZnhYdWxvVmVxT08yWVBXYnZlR3JOZC9w?=
 =?utf-8?B?b1BKMW5zRm8vbkhJTjI5V0pkQS9FYzh4NVhLeVdlOVJ3bXU5WlMvdEJBcXBl?=
 =?utf-8?B?Nys0eEF3MnhVU1A5eFZUQzhic2VXRkdCUFAyeDBkNG5janVJaTVMWjNrWitL?=
 =?utf-8?B?ek1hTXIva0tUODdHcE1FRjVCZ0o1M09QNDYzMExuUWtubDdZNWlhMGxXWTFF?=
 =?utf-8?B?Z0V1clY3SjlrTWRHTTZGcjBpdlNIc1RLeHZUZ2pYVm5YKzljSGdZNWw1elJ6?=
 =?utf-8?B?V3JHR3UxczdvNjkxdWxhWVVoVFJEVHBJTy8rakM0UUZNOTY4WmRQTGxiTGQy?=
 =?utf-8?B?Ym96QTAzclVLVGNjRFpwWWZJcmhJRE96RkNFM0hPV0RDM0lxTy90OTdqd0RF?=
 =?utf-8?B?TmZleSttandJUW8wNFJYQnBYaXg5Q2Zsb2dES3V1T2VRcWRZV1ZUc3IyNHlt?=
 =?utf-8?B?SUlLMFdsU0JRaCtiQm8vQlFSWDZWMHc5Rm10TXBZa1NFQmViSnNCSXc0dzhu?=
 =?utf-8?B?USsrSGNJKzY1N2I0N0Z6RCtVYjNUSUJEYXRGT0U0dHJCcFhZM3h1dGgrVTI1?=
 =?utf-8?B?Y0dBRmRmL1g4eU9tNEVuZWZFQkpQTUtqUFRNN25BcjczZ1Y5ZVBnZFU5ZStH?=
 =?utf-8?B?K28yajFYVU56K2h1dVl2Y2xjTDRnQnU5cHhvMll6VEV6YWRWVHZXdE5WY2c4?=
 =?utf-8?B?YVFOcDAzaUZpdHZSWEZoSzZnSVB1S2V5VzlDNkYzcm1wck1xU0tNdjFqT2pS?=
 =?utf-8?B?TTQ0bHNPT2psSVo4OEtkTDQ0L3kwcWtnWU1CWUFURW9PKzI0cEo0K3NMdklN?=
 =?utf-8?B?dmNFYWdDRnBVSFRFWnFVNHg1WXZhbUEwbWhCRzdHMm5MWVFHOHJZditTbWFL?=
 =?utf-8?B?WjJrZ1pYaEhoMnloQU8xL3NsT3pGNWFlaCtpbnB1SDZvcTIzQ1lWcnF2RjMv?=
 =?utf-8?B?ZDlWbG5HcDJEWDJhVkVMWE1tT0grZ3M4Ym9ValJWOUhuOHFVYWgxZ1IzZmxX?=
 =?utf-8?B?djVockhPZjhpOUs5MC9ZbjhpRTNnREZoOThiZlF1aTdUbGZtMTR2d2VhUXFz?=
 =?utf-8?B?RnY1bUZtVEZjK09Lc3NYYWNCc3RxL0tiWXVLTHFEZ1JOOTY4VnppWi90VURF?=
 =?utf-8?B?Qk5NYmdOVVY2NnNnck04blBKMkZ3dEFkRmovOVArZGlUNlVEWExlZUY5c3ox?=
 =?utf-8?B?RVl5UnNBU0dUcUh0L1FOanBJV21nN3YzMGZhbFAydVJiUFkrS3N2bUkzSFM1?=
 =?utf-8?B?emJ3RndWN0lSbDNlRkJ4dk5sVVlSMDgrS25RZ1NPZC9TMTNkOFdRT280aGVM?=
 =?utf-8?B?NWswdmdTdS81WHV1VUZDZ0xsK2lEdWNzaUF2MFhCcEtTM2ZadlNydGpnS1Mr?=
 =?utf-8?B?c1JSQmtVOHFRPT0=?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fd69e.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59748a75-a378-4edc-5deb-08de4989f28d
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0534.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 23:03:16.4139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0157
X-MailFrom: clement.dallasenn@outlook.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3FYX7TNBI4YFQOOFEUIF7SGUA3OQ3K5Y
X-Message-ID-Hash: 3FYX7TNBI4YFQOOFEUIF7SGUA3OQ3K5Y
X-Mailman-Approved-At: Fri, 02 Jan 2026 16:12:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JYV23AEVCVMO2F4GWDSTCZQKJUH74YQN/>
Archived-At: 
 <https://lore.freedesktop.org/<WA0P291MB0534F18AEECAFFD1FA83F23C8DBAA@WA0P291MB0534.POLP291.PROD.OUTLOOK.COM/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

hi, i am a linux user and i actually just build a pc with old parts 
laying around

unfortunately the only graphics card i got is a 1060 3gb and as you 
probably know Nvidia drop support for them some weeks ago, so i am now 
the proud owner of a paperweight, i just wanted to know how the nouveau 
project is doing.

as i tried the Nouveau drivers but it wasn't really good with a 1060, so 
i wanted to know as on https://nouveau.freedesktop.org/index.html it is 
said that there was little hope of reclocking becoming available for 
pascal gpu, and i wanted to know if since nvidia dropped thoses drivers 
if their stance on giving you nvidia signed authorisation changed or if 
you will be working on pascal gpu a little more now that the drivers for 
them are in the void


i know you probably have a lot of work for all nvidia gpu, i am only 
asking for information

happy new year for all thoses teams working on Mesa/Nouveau

TheCrabeuh720

