Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297ED29C39
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 02:53:49 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1D010E7DB;
	Fri, 16 Jan 2026 01:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="um0kg8gt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C27CB44CAB;
	Fri, 16 Jan 2026 01:45:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768527912;
 b=AjlD8nsTd2hFpi/X8RaXfMVwM5+Kjx8OuYe8y/a8rLMcIyOpxeSehrpNDAfoegDPC9ZTi
 LsYOqhBlrUmdJwkAvfQ/R1lURfHMzDCYJA9fgoN3pNZfD/g2x6eKM4x86z0WPja4RqVxyoi
 jTvIIhIRmBwmuQzKIh5r2HNKqjqg483tkK12ENEvocPEOejxTimDTEKVLOg++2jcCb2GFvR
 f+Cd8hSB3131S6B2dObnNGV7vyKsxSBhR06v+muj3e9abXnNMu6I6yOsTDsyrZM8Vmza4U/
 /kdvoVVmhCj/Pa8kUabRkliZGMqGn6JWmoOwaGL4yDynbB4C+ju1bVQa1TGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768527912; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GLv9npVOIzhRDO3C9xoDv6gPe21BLmh2t+Hm0/kXIK8=;
 b=HzEpIF0KlmiLWSb3cqaCeExyma+Bf//IrnGcHxxWIWAlLHTAfqWrUp81QmRvj2ljtDGyh
 M8hLvMoNk9KW/z04zkicZgDwKy1TIvzCbuOwMmxbE6IO640CN8/k4uuXoagOhtWjKsisvnJ
 UUOmPXyMJ5uKWr4TBBYi+6O805LVTxSDEUc9sAFC9pNKmGSSnr4qOGHlq7Glu8xnu1P9CmD
 cr3N6pJlW0QDNdBV/HYb3drJdKwOrOsY/TFMmHDX8a/BUzUVu/+POE22uStBW3gy1EP3hhZ
 6OsmvCt9wktt3IQt1y+HiOQ6A5aNerU+q/f7+PK9U6tYkgGhK0/QTpApSbxA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EDA9B44C5E
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 01:45:09 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013036.outbound.protection.outlook.com
 [40.93.201.36])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 062E410E7DB
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 01:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hs5tjvKXKann/j03BLdPqzULhSJEsxNa98kJwpBcsHLlI3Cn36jqyEEM3bIDuQU9C1Fc4Ro83J033qVMzqwXCF6BbIIwJdztfUljGgHcDgGdgDLq3rt3JEhyjy32VsjOD9VcETAxJ13F+2/uEnuo2Og+29VF4QqX+e+yH3ilpwZmphrkXRXfiE/y47GzfyGxYuKWxJ+U5WIvshsB2LMeB1jMASQM0gE6xHnGTmZI8KulKp885MTGVB2vpCpvMflKt9AmQFlqqZneOiBVSmfnMNywNdwT2slocGWH5ON30gBgfKQK72VgH9vAggLrNZfftnFiUR5vZI+PNdwK83/9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLv9npVOIzhRDO3C9xoDv6gPe21BLmh2t+Hm0/kXIK8=;
 b=DKtnpcElCvXM8bWVJ/v7Yq9iILiPoGFQOnorDpSKtJKlkURyxch1NiajGpRVcjidg0ese5WJSuVmWVe+JKYs9oCkPumxuUXEjDw5Ts6RVQKl18S1m0cdbsH1Oi9cTZPJsMswajoTb0h4p/qsyy4mjjrOXqR9GtqCDM8JhsvAJ3sswTSXf+OLjjB/5kPTI7FXFSYazXZbu7yd+XFmbcPHEV5wUZRLZqB+eYe4Dpw7vXrqhz1elQeUHDh27o9CJMQEHWstcNLkxwUBQalkiaFarvQKuxfgd9dfc7NNt9khxbbGNZZJy0gRh74jYT8MG/aYy/sV4a4IYWxaI2+BcQaGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLv9npVOIzhRDO3C9xoDv6gPe21BLmh2t+Hm0/kXIK8=;
 b=um0kg8gtGcUNI5nTA2B2fGQieMv7wB08ZIZqN1LW+tM3IhXnOxE1g5kUbTA5qNveX90jZMPL+wZXc8OOxg+AnhO9SwR0AdoYaiot2/gloEu7FHqG6deNbglU2nc6tTdgwAKslHewDSwqxvW1VwnlPZWDux4atObXUfeDIhrCu+lRwliLavocpe8oq8o5nPWoBgTFEezjbZEXIe071yF7mIY+REQPVmu2Fkdx5v/rLXGk3xXnszvUuL/wT6B7wRwKaHelYUlcjhhAKWAtnldHIBWYwRibPtZBjq6BqaBRypKlV0EUKe6t/l2rNH9dDyH2Q/P1crvh+XrqlE7MrdLO6A==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV9PR12MB9832.namprd12.prod.outlook.com (2603:10b6:408:2f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 01:53:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 01:53:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 10:53:36 +0900
Message-Id: <DFPN02R1FL1I.2YYMWZX57DEY8@nvidia.com>
Subject: Re: [PATCH v6 08/11] gpu: nova-core: add Falcon HAL method
 supports_dma()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-9-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-9-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:372::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV9PR12MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 17292711-af2b-42b3-e402-08de54a21266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmxuTkpvcnB2NVpBdTB2SzM3QlJhNWIzUkdlNFpiQjRTaXZVTkpCdWdSNXRr?=
 =?utf-8?B?aCtGRk9SbEFQRExMellzN29jK1Q1UlNPUGVPSXZBVDZDRklrZHVBK2p5T2xw?=
 =?utf-8?B?VG40cSszUTh1NERzdUgrNDlEZTRNS1p0VTdlRkxBNkRzbTY0ak82MFQxVis2?=
 =?utf-8?B?NUV0c3lwSVptdXdnV2NudTJWMkZUR2dYWWprUVRFZjlGOTRXUnBjbUc4STVR?=
 =?utf-8?B?bjFab2xDQm5WK0krNUdub0NuRFUvYXVhN2swTm5oZ3R3Qm1wTDFnVFpsekk1?=
 =?utf-8?B?QmgxSjhQK29TWG10SkRMcFB6VjVCS0FjZER0Z3k4R2lSam9DbTJOT1pYMmZq?=
 =?utf-8?B?T3h0VmdXK2NINU1YQWlZWU5OOTJWb1pLcWwrVitCaG9MYzRmSGFDeUFYc3hG?=
 =?utf-8?B?d0VvTDBGK2ZIa3dNQlc5bnpSL0FDVFlBSDArOStjZ0xBOHNLZm0wOGZ5YndM?=
 =?utf-8?B?SVhXMXFpNytCZy80ZUlrY3hRTDVFRi9KL2lNWUJoSEs2c1VJbGE3ajE1THF0?=
 =?utf-8?B?RFNZSXZUSk9SV2JmT3VyRzF3KzIrUUFZN3RWMmZPN3JOL0VDWkhMZExtVjRH?=
 =?utf-8?B?akRpbG9Ub1M0VHFnQnVvNDFDeWxXazFKeWpLN09GQjQ1UXMwTkxIUGNvdGF1?=
 =?utf-8?B?WFh2MW5uQXlaK2psY1Y3TGVpakcwdTdWVWtHc2lXYlBjRS85OGF5S0NxR0xF?=
 =?utf-8?B?SXFuQU9DV3pSQjBhSnRKdVVBcTlwWW9raUNuYTVmYlQ0VDRFWVcxbnA0ZkNK?=
 =?utf-8?B?TVU3TmxwRWswUVFHaE5LTnVEeS9BcTZYNWZhckdmUThBY3hKZ3Y3ck5DVzRQ?=
 =?utf-8?B?K3hDTmN1NFd5YWR2ZWhwRHlBTVc1MkhCbzFDQVZ2bXNwcXZNTDN6WDllbVl1?=
 =?utf-8?B?TXpKZE9oUTQ1TlB4eStadlpiVVE3eXFIMmdyNEk5dzJ1Vi9JTFhzMDJOWCth?=
 =?utf-8?B?SnFCMEtEVVZQa0JrcEM1NU5pUGNVUjlGcThwQS9DdWdzUEE2cENwbXd2S2pK?=
 =?utf-8?B?NG9YYlM1dDlEUEQ5VHEvTjJGWUpHcTd3N1lXdGw3N1QvR0R4MXFYT0tkVGgx?=
 =?utf-8?B?UE5PUDY2cGVRWXhONU5IOFdCU3RlYlI1ODg0U2VsbktUdWdqbTNPMDZwK3g2?=
 =?utf-8?B?OTN6V2RnVmkrZ3RRZjVYeFhJcy9MZUxzdDkrTDQwL1d0aW1Ra2V3YzNIVEFY?=
 =?utf-8?B?ang4ZHdJZjEwMTV2d1A0cmxWR2RobkRwbmh4Y3c2L0Zyb1VESWFBUHRMUkpi?=
 =?utf-8?B?NGEyYnpTVExiekZSck1BKzVZcmZGR2piTk1Jb0NVc2R1STlhbEZZMENpUU9K?=
 =?utf-8?B?WTJOQ21XY0V4d2JEbGx3Z1gzZmdIVFFseG9DcWk2VU9lOXVuM2E0anU4RjlC?=
 =?utf-8?B?Y1ZlMDE2M1NWcVJkdXV5NGk4TklHQnRwUU9HejEyNEVrUWwxZnNOeEFBWktC?=
 =?utf-8?B?dGxBc3hiQnJocnk1cjRpVHZOdW1mRjZ3ZEFaN0p1d0V3bTdWVlh5NUQwUnNR?=
 =?utf-8?B?c092NXgzK0tITnpQb2Z3Wmk3cU1QbzNXTlZ6R3FIUFFYN0pJVU1YdVk5VlhJ?=
 =?utf-8?B?aTRCakRCZXYwZ3JZcS9iQjZudmlnOGY3cmlRRW5aMDRUZEc3bytBdmpJVldt?=
 =?utf-8?B?K0tuSUM3aXF0YlhYbmdxYkk2UHh2ajJ4NHZxRjZWaThWWDlUZVdWV0VVUGJx?=
 =?utf-8?B?T1lNS2dxbU9zcTdmMGhidEVXZmFjc2RHM2FIeHBjbkpacVNHWHNtMjZLNTdt?=
 =?utf-8?B?Tll4Z0N1c2s3ZGt2a3U5N3JXRWhUN3o1YVhYSXBtV3NPbGJjNWRST3ZmamY0?=
 =?utf-8?B?YlhycWNZa1RhZHNVNU9YbWIwNVFYY2M2ZzBVVkIyaVRFd2l0QTN4S091UU8x?=
 =?utf-8?B?cG9HUVlPcDZTeHZibUcwZTRPUDZ1YW96NzVsamoxRzFoRER4L3NsbzhrT3pw?=
 =?utf-8?B?YldhUDg3MVNnWW1tMk1xYk1GbVFNOUhzdUZSUDZ3aEtXQnFqNG1mZU1QajVk?=
 =?utf-8?B?blVvdFgrMmF2UWozaFI3b2VXRStBbytKMVUzMVZJMXZQZGQyQk12UXpFZkgz?=
 =?utf-8?B?YlgwWUpFeDBWckRWTWxLYzFiVE8yckNGNG9EdHA4YWZVMzI0U2RiYTFBQjFj?=
 =?utf-8?Q?N0oA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V0krV0Jub0I5OFJtcDJkUmxFdW5BL2t3Yk5wQlU2cHd5Q3R0c1ZwYkR0VHVo?=
 =?utf-8?B?VXZXdFBjS3RkTkg2MkIxcWNScHhLTU5nVEpzQUEwOVJmN2puaXNlZ0lSZmJB?=
 =?utf-8?B?RlVwN3h0SHF0N3A4NHQ1OEl0T2F0d25tbnh2QXRNdkVDYmd3R0NTQ2NwUTly?=
 =?utf-8?B?M3hjUWVsVU1iWUtFS2hpa01xSXZNREZKWVQ1Y0YwQzlFSC9Gam5qR3p1SU5h?=
 =?utf-8?B?M05iUHVYNDVTcEIvRlFwRlMwNnl0T0N1dWVWU2tOZDVVZWVFUUF3QlVKb0ZG?=
 =?utf-8?B?aS9BUThPSTJPOHQrMDJRcVhIUFZzMEJlVThLWm1McVFXU21DN3JrNkFEY3di?=
 =?utf-8?B?N0dQSXo4RTA2UHM2K0Rya3ZHVFhVRjZVWUtWZmdwci81ZVBQcWgzV3NLS0tV?=
 =?utf-8?B?VzVnRWk5SEJjZUgzMUQ5MndscVFKZitEclB4MS82cEhUcjBZZE1LMGd6emcz?=
 =?utf-8?B?NkJQWlFYaUFhQ01LVDZDenAyeVVmamVOc3VtZTBwbVdiTzJqTWlFcHdmbmlh?=
 =?utf-8?B?NG9sR1lFUHlUUDBQM2IrQk5XM3BEdGpjR0lCZWVsM1FPN05kSnpOTitKeDUz?=
 =?utf-8?B?RjRHS0tLaUtiZkxlMFlJRWl6TnVWR0lUYWtOZ1dwK1NBN2toMGR2dDFrNGRt?=
 =?utf-8?B?QmJhc1ZDb1ZMelNtYW1qZGVsb1hMY1gyRzVFaWVWY3lDalJqaERucTFlbXky?=
 =?utf-8?B?ei9YU0lvWUlrTkFQOFl2UFU0a0xsL0JicmNBdHpCb0VUVnpKUDZObmZxUThG?=
 =?utf-8?B?RjRFZ1RuMlpDWkRiNDUzcVRUdE5BdzIwUFFEM1Y5Mm5HL3djOXJIWmphTE8y?=
 =?utf-8?B?Slh2UnViK2FLK1dhMEhtekZKb01IMDFZOC93dkFPTG5ncU1CbVVERjVyRzZn?=
 =?utf-8?B?ZDI5MEdReVdBQUVPRzNFTGh3WkN2T1AreDVrNHFMNzlyRnpqcEFpa2R6QitR?=
 =?utf-8?B?MzlJTDIrYXRoRjg5eFJjZWlSc1VmRy92VTgzWWQxSjd3SnJsS3NjRzI1czkr?=
 =?utf-8?B?VFh4aHFJSmFMK3IvbXR2UytvNzV0OVVESmNVR3RBNWxhRTBraGF0SGdvZEFC?=
 =?utf-8?B?YndvUm9ITWdNNVlRNFhSdVVBZFc1eUpxUVo0VTdvYUpJZWt6T1M1OXhsblda?=
 =?utf-8?B?UGRBaklFMzNQeTlaZmxvdW1wcVFXQkNVanh6U3plL1RROVR3M1RKem5XUTJD?=
 =?utf-8?B?Uk8za09HRG91MGJHcjVrYVYxV0Vubm5FY0ROZ2puMXdBeUZQMFhIZHFNUDEy?=
 =?utf-8?B?bDBCWmk1UHFsNUN4RkJCSXNjdFJKN3pYczFibkUrSEpiMmhQYUdlMzZTODV3?=
 =?utf-8?B?Q0ZhSUFoc0krb3hlclBEMThhQ0lydEl5eXpDZjJzNmpFdDMxNHk3TTR2OUYr?=
 =?utf-8?B?d3A4MXVkR0lkcjlZZ2JUZjBON3lDQlM1MDUwQXpNNFlFaS9ySmZJb3k0eGsz?=
 =?utf-8?B?M2xUd2dVeElPRURrMDZHbEhCWksyWWI0UnZ4bjRkTXVDTTdWMDBDTCtoTFdX?=
 =?utf-8?B?cmQxUzllNytjUnpweS9mdGJOUWk2dDVaRjFoUjFsQ0VITXljYUJDZUZ4eHZu?=
 =?utf-8?B?RUdGbVhzUGNMcytqVkZ5UWsrdkJha3N6bC95OXRmVGppcU5yT2cwVG1kU3lw?=
 =?utf-8?B?ejNvbzJvL1JqZDI5TTd6WXZGa0k5YnBDRXpoNitsWlRtcUVyK09HdGg5b3ZW?=
 =?utf-8?B?Skl5bTBsMFpGRWg2U3JVOG5adDE1WXVDU2FpV01aUkpGT0NtYnJ1VmlNUzVC?=
 =?utf-8?B?TnNEQ0dGRnRvVktpL2hwN3RqbThiZklRZHdsTXc2QitLbHE4cG9NMDlQWmVS?=
 =?utf-8?B?YVpjRWZMeWU0Z3dmaVFxeVRNZ0NwUTRzYXZTd1MrdUs2QWpicDFNUE40TTlT?=
 =?utf-8?B?QWhDNkJrblVBN2ZhVis0cFl1SGdrVk9mV1ZKYTExSVcxb1A4NjZ0N3lpVW5l?=
 =?utf-8?B?Ull5MWVxNFVTUjR1ZHF5NGRFWGFIS1AybUpaMjJuNDd3RktTVUZSTkQ2MGVm?=
 =?utf-8?B?aUIxbXQ3TTluTUkzY290cWo5bWx3c3hycEhUTVlTeDVlWTV1TXBqTFdVV3Ru?=
 =?utf-8?B?SFkweDVBK2xnSGVSY1VRaTc5RDFHemxkUmRhV21sZTlOWmJDNTRpYXR6Nkp5?=
 =?utf-8?B?NlRvYWxGOGlIc2k0SXFRVmlwVlhXZXlRbXo4RTBLeW9NSVZuTEh0THVrYy9U?=
 =?utf-8?B?dEtNaUdiSzlIWlNycGlXb0pxMTZSZDZicEk3amw0Y29VN1JuTXYwY0ttTndY?=
 =?utf-8?B?S0ExcHc1SDBrM0Z2Q3cxdE9jYlVvVll2MTJmellmYXpkTTMvUDZ2YnRUWVhq?=
 =?utf-8?B?WndGRkpvSDI0ZHhiSjIxTUMrUFpaYTcwS3F1TmVNbVIzclU0SzNLMkhzcEtR?=
 =?utf-8?Q?C07hrK8Rv0iA5+mwocG4wJwGbzlVmUH5P6TkkPzRX9RhE?=
X-MS-Exchange-AntiSpam-MessageData-1: F29zmB/44X3g6Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17292711-af2b-42b3-e402-08de54a21266
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 01:53:40.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qhYGQ71TrkMrurYyZuW+q1sfYbTJ3lDjS5MKxb4L2p4SfYNYxhNN89/r3gOnHCQhvf/oMwJcS3k2nkGu0mnmYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9832
Message-ID-Hash: F46U56D7KAHNWB33AMI3UXOCHRDUXZMY
X-Message-ID-Hash: F46U56D7KAHNWB33AMI3UXOCHRDUXZMY
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F46U56D7KAHNWB33AMI3UXOCHRDUXZMY/>
Archived-At: 
 <https://lore.freedesktop.org/DFPN02R1FL1I.2YYMWZX57DEY8@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 15, 2026 at 4:29 AM JST, Timur Tabi wrote:
> Some GPUs do not support using DMA to transfer code/data from system
> memory to Falcon memory, and instead must use programmed I/O (PIO).
> Add a function to the Falcon HAL to indicate whether a given GPU's
> Falcons support DMA for this purpose.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

This patch is completely undone by the last one. Let's just drop it.
