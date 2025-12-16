Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81572CC4387
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 17:19:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E614B10E846;
	Tue, 16 Dec 2025 16:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fRfOjgI7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3B137455F4;
	Tue, 16 Dec 2025 16:12:20 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765901540;
 b=hwmijtuPXUKp1ujipnf5472jBNoRWiTqmtGc/bT+HzP8PWi42YaoU7UC+9P0kSz7N6tKv
 YcIvVaxaMuHXvb+vw7kT2La7SMYebeNfgGSmtf+c1YkhxBv1a+3LTRg1ayAewfBwgeLcWv3
 u1Ep110pY9qMStE6ufIIszts5gNI2tExMnqq8FUN/wvU/x8gBt3kFwQ/mY1sHwpnblhKkhJ
 RVdTmR2AndZkMM8DYE1sbPh355XWAKx+htTePv2Ajzm6g09Yv6H+x/tXB9VnZSZAIVIuyBR
 9cVVpZUfRwyeq6WtVonBiBCTK8EaL0j7vfGQ8Mn+zKb4xZN3AZtdhq222TIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765901540; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cw3iZGUAReCx0LR6K3jkpd8AbzCwdU5OzQdQyMqWmSo=;
 b=rfoO1MQiv5sQpFyrF2qq0OcJH4y95ZCoukF+MKpqm452HDowycxflhWBTd4n2xgIKNlEQ
 u64iRCJgKJGpkn3NnWbLwkviiuuROIIUQfrulm9OuABp3r1tebnGEs9xemHIQxLWqRKUbdX
 bKhMXtsmDjZZgF8ueYEJti+gKYAKPLJyS9MRW49Upr7DJGUH1Yht0mI7FcUfqi5aXDpo83V
 1dmQ222oudRJ3pZEADpgt7fO+BWWwrQavyG4drHy9WIK59ZnFUUo9G3IVCbcaScYShmY+YC
 eOKVZZMvHTCBEdGUiiDGGm/yTdI/JAMgfd10j1Bq8bOnTZCci9inxWBbXi0g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9FBE3455AF
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 12:55:33 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B015210E912;
	Tue, 16 Dec 2025 13:02:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uO8O0WyqfhT9tr0VSSJHZ3X8SmOeJevvY6oaqnUlQ2n4kVAcdOtTLmBqiw2ks0Crk3Rnc/Vtd3TTM6lU9oeCKfi0sjaWAwj00UnaiEEaoNLETxAQAHT8S6FYZ20ogf/skyey9kvZMMhfbDPcG/FKn2IJ0i4zWM6M+iCpygK383VHpVnuspE+eizypFKjZQAgxGAJtd48JJeulihvv1kniKkVdeJ9rOCkATqshS6RrFJ5Fk6Tnf/XMltobMQD0VzARraQGCeYv3nD7LLzC1Y0NRtueyBcbcMYqQb6Jc08L+Qhm9eB1n13M9wipEcSUlv5Nc8wVycM7HVfh89SyL1ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw3iZGUAReCx0LR6K3jkpd8AbzCwdU5OzQdQyMqWmSo=;
 b=MSoG+sYlnF/YwHPY93FdknUtOS7uOavR/46N0XLXjowgLj6s67tVllp96M9YzlWiaVBDs0sSsW0H4PAKDK9olyfuZVvIwjGOf+o21z9b6C4y3DMFnS1PBPnZ77sl5qLNq5QNJwZu1YJEZlggwm+VH7A7TjmyhmN7IXiuWq4IGA2jXcZON3WNgc5p8ETM9B1lMiRhdM+RLxlTHA6awkYPcllnrxeWuWkaENjQJO+Q/5lMFRq04PDt02/lm07M15HnfJe9HZQk17RIaCBP9cEp1nQ57fUEbmJhGqfKOSCRFjNYaGBesYXgyjPyfODec4vD1HqEU8LCG9j5sSrKFY/PFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw3iZGUAReCx0LR6K3jkpd8AbzCwdU5OzQdQyMqWmSo=;
 b=fRfOjgI76ZO9eGQzjdzlvlAcURHRfFH7ZWfKVCob8lieV1qIZYOKfg8MGvwTnX7j79PLt2+QbeH1/8GcNXFtixxziONjNtkk8cq9xxWVCSk4YS7S/I2uHwE50mQhy0nP5GsUIC1dc9VlpknamV1LpO+OAFpaRZwH4+9Gs3PSW062dHW9xemcezAy2wEYEN2igVjhkqLxB6HdDSnQVjiRMc6DRo4ft5QCGFqQro0LW5Hu/VSKIthS9ZBkW7xrI9h79I8jRIkMz+INzgWC1zzaOBq69+5hPmXv2vV62v8StspmmtOBgb1wx6gGgr8WTs+sHuy7tWn3IGh0KKOYnkyu9Q==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB5637.namprd12.prod.outlook.com (2603:10b6:806:228::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 13:02:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 13:02:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 22:02:52 +0900
Message-Id: <DEZNTLSNCTMI.2ZGICVMVPHFJY@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Subject: Re: [PATCH v3 2/4] gpu: nova-core: gsp: fix length of received
 messages
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
 <20251216-nova-fixes-v3-2-c7469a71f7c4@nvidia.com>
 <63086256-CAD9-43AE-87CA-9569E6F392B1@nvidia.com>
In-Reply-To: <63086256-CAD9-43AE-87CA-9569E6F392B1@nvidia.com>
X-ClientProxiedBy: TY4P286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 9358ffe6-19cd-4ddd-afe3-08de3ca36ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzRneThiNUM3cW9hdElLTHB2cThIcUJZL0UrdTdxVU9FUVZrYXhvcCtPbnk3?=
 =?utf-8?B?bzRqZWZCbUdOREFmRGRpb0pVaTRXYU4rUGxUUGFFSmNxLzlkWDVCcUZkVGxj?=
 =?utf-8?B?ZWg5eU1RQ3BmSXpyZmE5ZzVJZ0Jqd3FwZUtGc3FYUWt4bWxlOURpb1JZa0Jm?=
 =?utf-8?B?ak8xT2o3NUxMcm54ZGVxc1dPUXBRU2FyaGg1VTg4bDhXeWlzaHBPczZtTkZz?=
 =?utf-8?B?VlY1NFBHaHVmNDdBL1psaVR6VTVOQXBDTTBERTAxY1F6R0FSalh5Y1VyNFd3?=
 =?utf-8?B?dHBFWE9zZmpVQjNQY2RYNld1SHo0dHJhbSt2UVpuUXhUUFFYeDJGeDRSb0Jm?=
 =?utf-8?B?cmJvMFlhczBMMUE4Z0F2UUJMMVR0cndVbXZxRTlDdE5yR2ZWYjZuaHJ1R0V4?=
 =?utf-8?B?cG9qNlVBcVJHa3FiK2wzYXN1cXU2RlVnb3BOV3VVMmNzb2VBM2ZiODZXWU95?=
 =?utf-8?B?Rm16QzluWmdlcHM3MVdsUHpvMjRHWC9GYTFlVndUS0ZQcGVUZUYzNTh1dlZF?=
 =?utf-8?B?OVlLQkRYOStNSDVsdTNwTTRsUU9MZE1mVkduaFV5MFJ4dTV1TmhXYTAzNXYv?=
 =?utf-8?B?Ymw0Y05Hd01rSTc1bTNiUkxlcHZ6VWg1aUszSCtmTGRHOEFPYys1RTU3aU1v?=
 =?utf-8?B?R1pmNHVBbnNPZzNJb3Nkb2o3clFMOWw4SHVBSDFGdXNiQ2VVbERMTXRNankz?=
 =?utf-8?B?UUJUVVNNMXdwbWd2N3ZueTRpUituR0l6Y2hobnh6cGl1WHljWFpybkEyM2pE?=
 =?utf-8?B?UUY3VkFZVDF1dnRySm1Rc2N2TXVoVjhtZ1ltZmVOWERvWklsQXR6MGZYaUhR?=
 =?utf-8?B?TnlOZWdtRW5BWWdkM2I0WkJQNnhxM09MRnBPTUNRNFVsc0kySWxzUUxqZ1JJ?=
 =?utf-8?B?TzI2aVlCS21CSmc5ckdYVkU5N3U5cTM5d1JCbjdSbzYrYVBwQ2hJNXZLeXlx?=
 =?utf-8?B?eTBqaFFOM3pmZW9ZSG1CMlJPbEgzRTg3SkdnMWE4Z3V3UlVrRlV6RVdaY2p4?=
 =?utf-8?B?cTg4Tytka3FZejk2SnJwY29FQ1JmNjJKVG9RZ2VNN1ljOHl2b2Y1dUtyekFM?=
 =?utf-8?B?V0NGV2g4UjZmTzFLTVNvZE9QdXQ0QSt4NjFRbDBXaGgrVFo3V2phMzIvdEJQ?=
 =?utf-8?B?aHZsN3BlTWVPTnhMV09KVlJWaHFDY0Mva2Y3TTYzRGx3am1IdUhJZG9ZanZw?=
 =?utf-8?B?TWEwQjM2eHYzMWxVS2Z3aGJpRWJRcHZpalVOSjc3SXAwd3NoaVFZNXI1VUd0?=
 =?utf-8?B?QkprTi9OZmE5R2N3eWtEQnRtcytSWFBuRTd4bGx2ODNWVGNOV2IzTzE4d01o?=
 =?utf-8?B?R2FwZHNBQnlvVk9Jb21CbjcrMkFnYW52emEvNml2YVJkU1ZWL1ZONGpmWnUy?=
 =?utf-8?B?c2gyWFFWSnUrMUVlQkc1cTZMQ3VSaHM3V1dWdnBpVnExZTBJMmJNS3lVbVVG?=
 =?utf-8?B?dmhZWkFmWGdLc2JBNWtmNHJpeUZ2NUpRY2U3UGpyakpwVWU4T0ZnTTB1WHgv?=
 =?utf-8?B?dUN6OXcrWXkyT3cxbmtjNlRKbWN4QXJCdFNWUkVhZkxzWmlQTWRYM2RoME5C?=
 =?utf-8?B?cjlOOUEzeDBlektMUUJWNHFEcTdUam12d3daZUgzczR4dFRNZTZHSlpkUW83?=
 =?utf-8?B?MnVIU3Nqc3ZGRDE2L0J0UGdtemRONXJSSFZmRjQ5bTM4a2ZCY1phNWVpdlFt?=
 =?utf-8?B?MmsyZkdjWjFldWJtaVI0M3FkRGZmSUVjQ0piRXF4RjBWYWJ1amw1RjdRYkdm?=
 =?utf-8?B?SG10Q21UNkVYWFlzdjZzQU1hNVFiR3RXdjB4cWlER3ZWUzRSSHRCVlU3QVVz?=
 =?utf-8?B?RXdKMnlEa1pkVkM2SDNrUmZobVRIbE9oSWRtUy9WZEpORkxsYkQ2eGhYMjcx?=
 =?utf-8?B?dnpSYlVTbkV6RVcvZCtGOHdqbkZxcHlnVVBoUXU2Qzl2SGczTGFHZkdMT21r?=
 =?utf-8?Q?u0RXDMQVm1AA3p3MIgemQ8D8KTeju8hY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0FRazBBdnFDMSs3R1BmcmFQQjl4VEw5R1JrNUp6cFd2cS9GVzJhOHJXYWFO?=
 =?utf-8?B?L1h6QmNMSXI5YmdESmVBc0F2YWdvYlJzRU9Pb1N4N0lMUFlVVGE5REl5YjZk?=
 =?utf-8?B?RUUrWnlKZnNzbEFNQjNMUnBBTXpKRFVjemViQUZ1bXRIWGE0aTdHdTdvWVVR?=
 =?utf-8?B?QWlhaVQxeE1RM0huWTVIS1hWdTZDdDhSb3hXRXpLdGtSeWlETU84Zmd1OVRu?=
 =?utf-8?B?c3htNmRKVXJxdlhEb0VIYmNkVXBsZmk2VGNmWE1PRjhpS2JBb2tSYzkrMDBi?=
 =?utf-8?B?SjNhUjlDV3g4cTNNbDRsSEZvY0JvL2VPZGoyeWNsbDl2V3MxL2gvRGZQcnZz?=
 =?utf-8?B?ZFp0OVR2eGZlV0hoVkdsUk82TnVQY1JFdDEvR0ZKU3dWWTZBN2diY3VXZW9O?=
 =?utf-8?B?aXpWSTdVaG5jTVJWb3kvbDd5Rk9WbXRhZ29udWRmN0tBZGdUaERsZ29uZTRR?=
 =?utf-8?B?NjkrOUJmSDF1T1ZLRTFMWnJJWXpKNFJaaEp4RGRmcmtQekhVMjMzR042eGxP?=
 =?utf-8?B?WlBBRGN0TlJjU0JNQ0M0SnQ3eU95ZTBTa2pvNkJUY0VuWXd2R05QYmNnQkZN?=
 =?utf-8?B?L0twL0VCOU16THJOU2VGMGxPMWdhdEtHV2J5Yys3WHl5c3pneWMxeE4rU1BY?=
 =?utf-8?B?OWdJVW1wT2RLOUhUYTFFcXY4SUZ5cENwbDJaLzlKMGNBcUF2THpid1pXc0lQ?=
 =?utf-8?B?cVZxZmhoRWJDVnRMSkRPaTNiVVdPcDRJWkRkbGJ4ODluSW80bWFsT1NoSTlp?=
 =?utf-8?B?eFJHN2lZOEcrbVV5OHZkRnQzMlNZSk50UkJGbmJva2czNERnUjFQbDNsWDFB?=
 =?utf-8?B?Znhwa01oTEhLSlVVWTM5dmhtQ3kvYVRud2E3MXgzWm5DaGhoYzN5WU52STZT?=
 =?utf-8?B?dEFUTVNUOVNpQkZXcFZqdUFPNm50R3llL0JZRzFHcnArMWJieGM5QkJHNFN6?=
 =?utf-8?B?ZGlMSitnOEhLWlNibDM5eWpWZ2Rpc3FWZmhmMmk2VVZRWmdLNGE0R2wyTkdp?=
 =?utf-8?B?TUM2WS9qMDl5cG9RSXo0Sk5POXVPbGdoY2tVanh3NzV2Uk1HaDBYVnVwRDNZ?=
 =?utf-8?B?a2RaZi9GQVFQSUJCckozOElSOUlIWE1lTUpiM042VzMwNWVkTzc1ZU5xQ1c1?=
 =?utf-8?B?bDVVZmdNdC85ZEdEZjVmdTU1TnRYMHduSVZKOG9XZVpnRW9TaWIxbkF1WFBy?=
 =?utf-8?B?TWNqd2IrUmdTN04rZExsRVNhRFp5WWRwN282OWRXcmdSRnpiQ256OTdwQnpU?=
 =?utf-8?B?TnhDNFNTMVFma3lZcWQwaWFXWEpBYy93dWx1K0lYMWlyVjhlZ0VxbVJrU1Bw?=
 =?utf-8?B?SVF6NmRDZG1zSUV4WGd1Q2F5OHcvL0F0SE53OGxlY29VSnhGSlh3cDZGRjZU?=
 =?utf-8?B?MkFRVVdyM2RWdmpCWE5jcVpEaEpRZ2hQMlRYQW1xRU1WTGpHb1RLNEw0dWVZ?=
 =?utf-8?B?Z1VSSnlVd3dhLzZwSSs4bUJDVUxURW9sektWTHE3VkpIVHIvMnhXSWVGTUlK?=
 =?utf-8?B?YU5hcnlSUTkyam1ldkI0aHJrOFVvQTB4bmJkdG9LWWt5b2xKZ2FCZ2h0LzZt?=
 =?utf-8?B?TUZLSkJyQUFCMmo2ZHp0T3hMTUwyOWtkNFFiZ1NBWE1rME8xUXEyeEY4NDIr?=
 =?utf-8?B?NGthc2JlcTVjbTBsZ3dyOWU2RUhjM3dVZGNoaDdKWkpPT1lRS1hyUzhxc2Rw?=
 =?utf-8?B?elgxTGxqMEY3cVIwOEtJZEg3d1VUUDlsVExrZHoyRnRIRVVMQ3paZHREa3VQ?=
 =?utf-8?B?dytHSVprdGNzbXFEdUxLYWQ2dGlMTEJHcTFiWGI4bGkzZHU5ZUZKanBwRVh4?=
 =?utf-8?B?ZE8xWmJtOGVjOTcvRTd4Vm5jSXNiSzhVeHFmVy9nb3hlY29LYWIyMWcrWXp4?=
 =?utf-8?B?RlhOUzZCN21EVGttd2tHNE93L0UwRjFBSjN2RktsUGRaMHpkZ2lRVmY3MkN1?=
 =?utf-8?B?MDNzY09JQ29sM0dqOWFNMGN1cnBXcWVrTUJrMEVSc01wSlpjN3dQMEJXNTlt?=
 =?utf-8?B?R3cxeFNxc1pKS0JLWjJIWldQRVhxcW1VR1d0dWJod2NpUmpsSG1la0VEWWwz?=
 =?utf-8?B?UWMwekV3djR3Qk5TWnVLWi8rcmpsWWxBam9tSXd4dmI4eUhnazRoZHVVK2lG?=
 =?utf-8?B?WS9YNnNqSWwyVGptRGxXaGNKSjFTNTFRNjMrSkdtU0JjU2I4K2hBYW9DUHF2?=
 =?utf-8?Q?+HMAzHy9CLfApcGaUNWDM0flhCs3PWsfKGqGl9HWC+2I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9358ffe6-19cd-4ddd-afe3-08de3ca36ddd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 13:02:55.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xOKZk6+W77VUmiCspab3ajjZt8gL1i/V6iyKHF46tu255r76CUKhQj89sTH124puuqjXL9r0MD9yvasmMkyf2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5637
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: DGT7ZY2IHR5VO2UAU7D6GNSPIQLFNU7M
X-Message-ID-Hash: DGT7ZY2IHR5VO2UAU7D6GNSPIQLFNU7M
X-Mailman-Approved-At: Tue, 16 Dec 2025 16:12:18 +0000
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DGT7ZY2IHR5VO2UAU7D6GNSPIQLFNU7M/>
Archived-At: 
 <https://lore.freedesktop.org/DEZNTLSNCTMI.2ZGICVMVPHFJY@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 16, 2025 at 6:21 PM JST, Joel Fernandes wrote:
> Hi Alex,
>
>> On Dec 15, 2025, at 9:57=E2=80=AFPM, Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>>=20
>> =EF=BB=BFThe size of messages' payload is miscalculated, leading to extr=
a data
>> passed to the message handler. While this is not a problem with our
>> current set of commands, others with a variable-length payload may
>> misbehave. Fix this by introducing a method returning the payload size
>> and using it.
>>=20
>> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue binding=
s and handling")
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> drivers/gpu/nova-core/gsp/cmdq.rs | 10 ++++++----
>> drivers/gpu/nova-core/gsp/fw.rs   | 13 +++++++++----
>> 2 files changed, 15 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 6f946d14868a..7985a0b3f769 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -588,21 +588,23 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<G=
spMessage<'_>> {
>>             header.length(),
>>         );
>>=20
>> +        let payload_length =3D header.payload_length();
>> +
>>         // Check that the driver read area is large enough for the messa=
ge.
>> -        if slice_1.len() + slice_2.len() < header.length() {
>> +        if slice_1.len() + slice_2.len() < payload_length {
>>             return Err(EIO);
>>         }
>>=20
>>         // Cut the message slices down to the actual length of the messa=
ge.
>> -        let (slice_1, slice_2) =3D if slice_1.len() > header.length() {
>> +        let (slice_1, slice_2) =3D if slice_1.len() > payload_length {
>>             // PANIC: we checked above that `slice_1` is at least as lon=
g as `msg_header.length()`.
>> -            (slice_1.split_at(header.length()).0, &slice_2[0..0])
>> +            (slice_1.split_at(payload_length).0, &slice_2[0..0])
>>         } else {
>>             (
>>                 slice_1,
>>                 // PANIC: we checked above that `slice_1.len() + slice_2=
.len()` is at least as
>>                 // large as `msg_header.length()`.
>> -                slice_2.split_at(header.length() - slice_1.len()).0,
>> +                slice_2.split_at(payload_length - slice_1.len()).0,
>
> The panic comments also need updating?

Oh, they do - nice catch, thanks!

