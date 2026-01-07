Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4DCFF115
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 18:20:53 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2891910E649;
	Wed,  7 Jan 2026 17:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y+VsJ4fn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4D7D344CA3;
	Wed,  7 Jan 2026 17:12:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767805956;
 b=fUl025Uih0lOEyMneJEXxOzlqOEbaT/ApdYCzEZMbTH+iCGBmpGJQhshvCdF2DDWXrG9/
 HuEjndpx85Ks3XAdWXILCUceCMcBjd7CmzfGelDNRYEmDseDTSdmrQ3sFGeXmsd/ACRjaQl
 uPRMIF/gT7lK182L1lDsY8PfwNuwJtErt2TxPJNJiImxagMbAfGQmcG1F0hIHh+I9iF6wOc
 H6rOidTT+r1mF+7gAB2tRlEqER2oY95WLofxqAOsCcvQ62DEt8TJWX3t2BViodW2B9XSPpT
 PmU34LTNxPrJcNF6PY6k/1/Z1OTg90JXPK8rt8aefthfYbADLpluNt5LfSEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767805956; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DWymy0WiET8/LIxGC+udw1GDou04wNygulgbqZHfQ6E=;
 b=d1HcY1Ph6rlyf5U5q2H4mzWQ4IzLfwqZvuARqZmtqqvnwGGlODTvFXNm4wQowH/1FCCwy
 QSXQqDKh1uSu2x+XYbdx021PzZ+nzTaRt4Cq6a8Ab5G6m5zS72qacrojSSk60frTByHInV3
 eoX5fxkWyxcH+L+haLzR08UAEW9dcR4Xmj44ZzmXHnqOTunEM3ByH4jZHxKWWbdm6bFc7dm
 RHFweyZBfTqCv90xhMovfP17nnB1lx/H+Y9AEG1FEd1g84+FlBo2zcCM8HEbjf9PUrYnmFd
 SoIKhXO022VpksaVK4GMvHSznFuSArZgdB4IfyJZbWbu8X0aXRfsoCuKXTzQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EC51244C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:12:32 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 59F4F10E60D
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 17:20:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knhBf/vtbI80CZ+qPQpNKxnK614z0dK9neSoCUH4bphFzt9+VuVZSpnmNuNDduckDKIGW/xHMYgm97/NEMeR1mGf1zX3QFIsl6bReWNkf/SUCJrF+Wl0cQ6FglTkOWkrwvvZ8a+AKrF71mdjvfHMhMsT8hj7oKl5b7Dxkjp59JVQWa7QDVVK0sTDgjmMZyK58ZecpLOM1Qo2UVUhFEzo3Fw2wj0l6DWfz55S02eH91Xib1G+6wN2+BBlZLgHem5KKTKW/wYgYCPn0qk8A/MCjUEFf+YQm/yH895FM5lizexkFyMT+hgo4J1zHX5PD0Jpe81K69o7Fkz+Vg0v+o0BrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWymy0WiET8/LIxGC+udw1GDou04wNygulgbqZHfQ6E=;
 b=oPPq2vbWfzjEZBKTvLT2VRiHCBb2QMk7SdX9ZIN79YsNsQ2l001oqh3JH0Rmhr3cEcybsn4RDI3EDqB77EorW7dI3dz0grtWfA+S8QjB4gXF/ogRx/MesOqkY1ijSBdkV3EQ9wF8A1QPqFJNWt4HDU/h2hh7v/yKXq0QyFB70SDm2YxolwQartr32SGjZYffsRWke2pa/PXHI9fDcHmxW7Gw79G3TV3vcNgBmVcl4Z6VPGfeSIfh0PRp+RM2G/W6zEiTiIjQJzoxh/+kwGaKJGq5zpje5L3hduM6F5qOJLqh19B8ZK5HngJEsgDum7mo+iBGGloSMSQBIuaXVR2qAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWymy0WiET8/LIxGC+udw1GDou04wNygulgbqZHfQ6E=;
 b=Y+VsJ4fn+5AAZs83UDFakWteLpfU22OTWC4o3qyK453tv8vGzJA1NECu4jJNiB6IO9ae0aZUSq02pBg1fpnARiR0PG4CbBLHNnXL+KDeRr94oQNLHhS1Qw7eyIns/u3s42ZJDdUvZkdGYucC0745M+KtY5BM7iyR9zf1ykHR+g5WsS+7ejc4UUvClKb3mFbpsQno2WtbTagya6OD5gkCGgjzPvD6QuIMJmn+KsqOxBFMtPiRR/4XeF0hWgP/7oLnXOPzR7qvs2OoOP4hVexcSP8m1XlFIY3LQCXhtMFoLQ7/LLdYqYvFX7z7B5BiJP4L9rIPavQZhPj9wKdGMmjbPA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7538.namprd12.prod.outlook.com (2603:10b6:930:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:20:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:20:45 +0000
Message-ID: <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
Date: Wed, 7 Jan 2026 12:20:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
 <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
 <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: 
 <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 51aa2016-5bea-443e-4865-08de4e111786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NWpXa1FPNURSWHg0MXlNbHAxNVFheDljRTF1eStHaHRvUDQvandXUDRIRk0y?=
 =?utf-8?B?ZFgxSVB5UUZ0aTRJeVFGUXk4T1FyNHN0V2lTMWZoc0pwYXo2RDVBNEFwRTZQ?=
 =?utf-8?B?R1E5N2FXWDVrL2NnQlFKSXI1STJXK1ZRL2FqUDZOaXFRUVlhS01kV2QvMFM5?=
 =?utf-8?B?RmlNV1RIWVoydk53WjNUMHZJOTIxL2UzL2hmcUw5c3h6emFxUHpBdU1MTno3?=
 =?utf-8?B?M3VtdWdGRFphbjNsRGxmMlJybFpMNWRObUp6ek9VblRIVVBqVVJveUhabm1v?=
 =?utf-8?B?c3BJUWpxbkdSMUtmQUYrRk1JRHVSaExNcU53anVjbGdzb3hjSXM4Nm5QYVVF?=
 =?utf-8?B?aUtYdXl2bzdOOUp1MjZEb0lqZEFhNjJxTlRxZTA5cVNaRFBYY0wyNlZacENl?=
 =?utf-8?B?K2xwZmY1Vm9yMEtvVUJUcnYrRU01STRUSytPU2t3VGc1ZDBCZE04OXRsSjdu?=
 =?utf-8?B?RkpPM2I3V3NpSnJoTDN5YVVBa25CNWljelY0UytzS3NjK1dGd3c1Y2V6NC9N?=
 =?utf-8?B?MWw0Nk5rcVBDdmUraDdPN0RBT0RXRXgvOEdUQmhseW8yUlJGYURkNnQyS1JF?=
 =?utf-8?B?NElyb3UvSE1SOHBVZTRwWG1PQklvS1BvcHhaU2tSQS83Y1dDYThkQitSd1lR?=
 =?utf-8?B?bzVSNnVtUEMreUlZVEtQblFwNERIL2w5WGdKdXhiWDNLMlJtamgxYk9aVnZ4?=
 =?utf-8?B?M3hYckdaeDU5MGd3bVNtV1BkeEh1d21OenJwOXRGWHFQaFRpQ1VsRFhSNDhW?=
 =?utf-8?B?TWNxckwxd0ZZbnZtWWMwNWtTOVdWTVY1ZGhWV2JjcmFUck5Wem9idjVSWHR1?=
 =?utf-8?B?ZGxuQUUzamRTVHpzRWJkSzBINVpxRTh5NnVMUThWWCtwZHBrTk9Ya25uVDRN?=
 =?utf-8?B?NWZvcFdBTUJKbzVGWmpDY2N3V2hWSDdnTUVEOWYzNGt0Rk9EMHZNS2hWam4z?=
 =?utf-8?B?dGQ2ZGdpdUlhMjNhZzRza2JwcjlqMjF0Y0EvdmU2d3dxaWZzNFAySjkzbEx3?=
 =?utf-8?B?dTJQcTNabUNuZjNpTzlBRzZKcW81WVhadkYvNlZUNnNoYW9lWFBrR056OTNP?=
 =?utf-8?B?eFJnL3NUOUNhOUQ5em1MbFZHdTNQdTFzYUdNdmc5YmVsZFQrcFFRZ2NFQjd6?=
 =?utf-8?B?Sk1WeWRwRGZBMjZHZ1lTcWMzN2hHdHd2RnAzTWE4MGRIOTJFSWJNRFZwcm0z?=
 =?utf-8?B?UHNCb0FzRElWN0ZoWTNUMFlNQ3N4WEZPc01OZmZ4Rm5QVHRwNC82endncU4x?=
 =?utf-8?B?UXZsMzNCUC9rOGt4RDNPei91YmFaNkc4NnJwcXVCMWF3YWdCeGQydkxFL2VE?=
 =?utf-8?B?aE5hVitCdkRuNTZxMTM1eE5WVTNDbGdzK0FYcXUrMW9kVkEzWUE3c01KaHpE?=
 =?utf-8?B?NjNxclZ4ZFdSekpoTGJEUnNjN3Y2K3RlTENlQ1lTdlNQc2NwdktKbzkvL3Bx?=
 =?utf-8?B?UXRCR3hEOHd1VnN1VDBneG5kcmZqaDgvdUd6d2YrVWQ3VXZyYXBWOVdYY3pz?=
 =?utf-8?B?OW4yL0dmem95dnkxaUlyWmQzNXFjTVBMT212OUdObVhrUXNQdDErSnNlQVZr?=
 =?utf-8?B?YVE2YTZhblcwVEJRUTZ0USthVnJvQUYyMUFnUEo3RWFzcWpXejhFaUpsbndl?=
 =?utf-8?B?WUtLb1RlbXlMdXk1ZDFrQzVZZDJ6K3htY2tNbnVaOTlHcHZxaHZZMU9JSGlP?=
 =?utf-8?B?bE42czRENWVFUEtFWUg5TURtL2xtb2Q5bzBraHMvVDFMVThkMWc0LzFlcklQ?=
 =?utf-8?B?Smtad2o0blAxSno5Mk1WaG55MVB6enBWQnRVZHRoUkRKQVJVT2dDRU1GaTZD?=
 =?utf-8?B?aTJtbFVTbjlJQ3FWMnNMc0JXeWgwbEJ1ekZsYW1RSGFqcjNjQUNsYm1nV3Uy?=
 =?utf-8?B?VjRWU1VJRmIzUTcwV0hJR3FZZklWQjFac2FwRkhYcFd3M1ZFM1RxMHlsL3Zq?=
 =?utf-8?Q?tgc7q+WJBzD/i4HGm2IsrxgvcHrACqGi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXN1Q0pqMjU4dnp5VGlSNStudUlHTFFaM2NiS1QvM2grSTRwVU9TMlFsQ09E?=
 =?utf-8?B?MnFvNlV0ZEwyYzlxOFRXc3hFWk9qaDJWUVZNTG93UmpuMnEzZnJtRGFMSkdh?=
 =?utf-8?B?ZGJJUzZLNHpOTFBzYklNN3UxTjRKZVJOWHQyaEV5L0FibDNmcUZmb3EySUZm?=
 =?utf-8?B?TUZtdmMzeHRlakh5b1M1OEpTQjA0akdrcVQveGdSb3pxSENiTFFUaEZ1ZERl?=
 =?utf-8?B?M2JlYlpsZ0ZmU1FMby9abG1oVTNFQ295SCs5clRKZzNRNHlJcWRxM0hNTFJ5?=
 =?utf-8?B?WURkY04wRmw5QkFXOHJOUEhVbC9DSG9ocVRRd3FML0xuRTZFR1o3MHQ4b2gv?=
 =?utf-8?B?UStBUEJzTHQ5dnlvS1hEYUNVRFJVUTFvcXlvS3Z4SW0ySHB4STRrWDZUZGNz?=
 =?utf-8?B?YlRWVTZPZ0htaFJETTBuOGUwb1h1OFpvTWJDM2J5a081dkVmMWtoaEZDL2h5?=
 =?utf-8?B?WnpsODhjRU1Yd0ZMRlhPSFdMRGNjdHcxNVRWazNxQ2xhY01SaEZJR0dJSWRu?=
 =?utf-8?B?V3dyMmovS2g4TDJEK2VMVWdCRUxxbnREV2YxM0FTUEtIOUdtbERQeUFtdDFv?=
 =?utf-8?B?bWdjYmUrdWhXeVcyOTdqRUNjZkJIeXBXa3IrSlhMeVB5N3JNaGpGRm9NTmhT?=
 =?utf-8?B?b0hES0ZFdmNFczI0Uy94QkhWaHRySTh4YTdybGJQYTlZY2ZJWmJLM0tQd0wr?=
 =?utf-8?B?dHRIdEE5bDNldTRMUmkvYWU0N1AvbVlJMGg2Qzh6UW9aRiszY2hVZ29xVnBu?=
 =?utf-8?B?V0ROWTB1ejdxdU8zdXU3S05kMVVUWmI4V1FrcCtpRTk5ZVNtODRLZWFUVWhD?=
 =?utf-8?B?TDNZYU9Nb2Y0L2JBemovelN3NEM1eFplNjVLdXdFMHYyYTE1dFovQ09TeVVi?=
 =?utf-8?B?blJXVysxTW5URjJZUWVwUHZVTnF1eVJCTk9QaEVsTUxXQlYrT3NNTUxGRENP?=
 =?utf-8?B?QlBtODI2c1krL3czV3dmaExwL1o4NXJHN2FVTUpSMVVtWk9yVWdVTHFydlYx?=
 =?utf-8?B?YnlITmRxQkxXckYyNHpTRElIS09rdWdkWTVDdXAzamhiUngrc2pQRzJOb0c3?=
 =?utf-8?B?QUY1Ty9xc1N5b29oWTBRSEV3R054Qm9DUCtJdndpWVRGWSsvSE1UM1k1OVdr?=
 =?utf-8?B?S0hDY0lpbzIzdStQOXdVN2YwSEIxOUh6UWp4cVd4OXdhamU1TFNkV0FKcWty?=
 =?utf-8?B?TlpETGtRemxQR2dPMkR2bytFd0V2L3BONlM3NC9KdnJDMnA1cWdRbmIvMFY4?=
 =?utf-8?B?OXQ5Z3c0QVR2a2VYTHo3dkMrdFZJQmRBVjU2amVBRGlyMFlSeVNvWWM0ZVpq?=
 =?utf-8?B?NTAxWTdkWlZlYkNaeTl1K3R1cTFoMUgvRmE5b1hCLzdBMUtEYTB2YjFDWllz?=
 =?utf-8?B?dE9ia0ZGczBEbTFMVGJKY2JkVzlQNkJaRlYwelJxQWd5YVI3RTdNTVNjSVRY?=
 =?utf-8?B?YTFTY09TZ0VPZ2czYlJNem1yMm43eFJkY1p0M0xOSEZocG5ROTRxWG8xd002?=
 =?utf-8?B?aGM4Umg0QWM2UVRRUm9iaTFnUjJqT3QxYURHcTk2SG95MnFCYnd1YTYxOW8v?=
 =?utf-8?B?M2lsQnh4ZHNNQk5vODB0aDVCcnVMcmZvcjYwK2dNbGFKTmlQUG9oR09KNlUr?=
 =?utf-8?B?NkhKUVlJbXlGd1gxNWNWU1RYTkZVUk41MEFSZVpXbGtNM0NUVTl3QXZUem1F?=
 =?utf-8?B?MXJvdlJqNE5xRFNzUWF3dXRjeGg1NjRCMVlJSGc1dFZQcWRKYmxvaFlTUnZj?=
 =?utf-8?B?cnNzS3VIYzAweDNnY2QycUdNRjVCbHRzUDl3Ym5aZmt0Y1VxV1VUS0JYV3Fs?=
 =?utf-8?B?aC82RTh2WnBTaWQ5dk5Sa1M4NXBERHcxQ3haTW1oWlFaemxXdjBaMTY0VTd3?=
 =?utf-8?B?MVBPMzVGaHR0bnBFemdiQjlWay9ETzNQdklYOXVsaURtM1RFZWd4emQ4SEJW?=
 =?utf-8?B?b1c2WkdJRE9MbGZmV0VGQ3Z1VWs1Wm9Cd082dVN4TmRZWXAwd3RKVmUyYzlI?=
 =?utf-8?B?NThISGNSL1N3Y0lLZnIxcDlJYWpwUjBFdDhFdTQzaGh6V0lHSWhiTjh5cnRk?=
 =?utf-8?B?NmYyWGM1Q293YWhQU25VSzV5NDJLT0VFSCtWTmlid0lDRGVIZ3QwZjJNenp2?=
 =?utf-8?B?Rk9wSFhBQXdZdFRxWWRGS0VFc3Z5RzJhbVdpaDN1bTRWcndHQWczNkpJaHV6?=
 =?utf-8?B?TWhHVDlZQW1YbGVQRUVzZEtOek4wdXRoa2E4eSszaTg4M0V2ajJnL2ptOGNu?=
 =?utf-8?B?SDEyTTFFOXlCS1Izd2VGZGljUXQ3T3l2Z0RqSUhvcmRhMEZrOEExVk11QmIr?=
 =?utf-8?B?cXhHTFBqbTd6S1JCQTY1dzFsSEVxOStzaHpCNldsQWZsc3Fqd0RSdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51aa2016-5bea-443e-4865-08de4e111786
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:20:45.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VUywybBNdl+Fniq+0NTCY8J69YCRQDzyBvJpcTurZjxSDLFlCaI4a7CvKaTouBChmU3CyovyyFlaS75QaCg6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7538
Message-ID-Hash: OKMKCIA7O47YWXWZRVD7U3ALT5RCPIPL
X-Message-ID-Hash: OKMKCIA7O47YWXWZRVD7U3ALT5RCPIPL
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 nouveau@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Paul E McKenney <paulmck@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Steven Rostedt <rostedt@goodmis.org>, rostedt@google.com,
 Yury Norov <yury.norov@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OKMKCIA7O47YWXWZRVD7U3ALT5RCPIPL/>
Archived-At: 
 <https://lore.freedesktop.org/39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 1/7/2026 7:46 AM, Miguel Ojeda wrote:
> On Tue, Jan 6, 2026 at 11:56 AM Joel Fernandes <joel@joelfernandes.org> wrote:
>>
>> It is more important that mailing list traffic does not have issues which unfortunately us and other company domains have experienced. I have been using my domain for a long time without incident.
> 
> You could consider a kernel.org one too!
> 

Thank you for the suggestion! Unfortunately, that would hide the company
attribution too. Or require it to be in brackets along with the name. There
appears to be resistance to both these. I do feel fortunate to get company time
to work upstream, so, on this matter, I have to go with the company's
preferences.;-). There also appears to be significant progress now to resolve
the email issues which looks promising (thanks Jason, John and everyone for the
efforts!).

Happy New Year! Thanks,

 - Joel

