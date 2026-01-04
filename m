Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA40ACF116D
	for <lists+nouveau@lfdr.de>; Sun, 04 Jan 2026 16:01:19 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 27AAC10E275;
	Sun,  4 Jan 2026 15:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gW6R98Tb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 37EA244C6A;
	Sun,  4 Jan 2026 14:53:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767538388;
 b=kwXf1avOYJGnBontjJ5aekSZpnytXJqvyFya9MHzPl/yDlhEIvh59wjRx+eJ8l5gcNsqi
 uSG+MuX5S1iRti6dAiEXfrzyeE+wyPqV9D9ZWWVGor/JAbkT9bFEqFQuCv6aIZyTqgEA16q
 2InISYvSEYLwRFHZc/iZlN+eCWLePMPleCeDk385GA8vRYuY0yGmv9TqZ4+sdx8kDKE4lfy
 FuTkVIUssdjJpH0OhDugumxhO4Ttib+ZKuNRMMahBjlMNnUPY4v4lxvWk9G99nypCSuIGz1
 50KWEuV+sY+fEGvzfkbBNvvRY+2NIeiLePMBjmj19n3nBjCNevjOQN6O3wFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767538388; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=THPZ5GzFJKpKhG8aWRQn2DOsYEcdVkF+TIsb7q3X3s0=;
 b=QCtATX4R+c2UwIVG/p63H0z88echnYPibi3CeBixIaeFHaI9jsETMbNaTuYqFfzWgvDL+
 pJ1WTkn6p5nyVO4nWJd8BLesPaBoCN7Z2iXeYCORbsejdmyKXBeTbOWy0thWNLwtTNezNyq
 LQb1Ro55FFqn6FDox0ch0cK2GMf94CGjVuGA4Iuk/kNIsud1QhFoqDnooq0cpxb3tUgMX8p
 D83nx5ihlMxKAnMCvCt3j2rYbm3cVpJuqjpdz/IzXNWE52e3DWf+HrvD4ZEj+6pNkGN2/pK
 zXxz626LnqvukG7GQJPi0hcJS3CxDr/kOUcbyz3w3tJPNClhcc9QAFjgLxtw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 33688446B9
	for <nouveau@lists.freedesktop.org>; Sun,  4 Jan 2026 14:53:06 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AEDF410E22A
	for <nouveau@lists.freedesktop.org>; Sun,  4 Jan 2026 15:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THz3g6Uf/kRrAjK1JeGRpE8VaZwfNPbbhf2tLn/McV2KCmPVeUR3FVu/WhnHwyLUIyUEQipXxkisjBylB2rWiCBT7pUBnnrIdtqsL7znb9W3MVO6E6Io+Cu9RdIHoRwtSgFcPcGQJMGNay3stFB53Fu4f3ULIQT1NID8iQdWn/Qk5blm55j3dnG3EVjDvVofjgCQVKYwL5M+pqunQk0JZzezWDlMWsiijjOpzfIm2LbnkZGFdC2HzLDWi5mMpGT9rTTE6TgQiLilU1Ceh1VBy9/lbozUIxPa/rDKfPGFFRJ1/CEVZNow0VSbq6l7z2fSYp7DFnQX2e0syCB554OUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THPZ5GzFJKpKhG8aWRQn2DOsYEcdVkF+TIsb7q3X3s0=;
 b=CHvANfH5crgfb5UUUg66TD2KbpLBLPXdyF7YmKGGRdn5Dm4xgmI8J0ZszYoDRV7hxXmMSsMZBg+dCGeocGMv2g1bBW96Dl60Ds7NEcPxcJmbTcLw21ET7kx0zZddECbSrFAh+y4zjBT80vhgMMhkokJh90C6lkvM3u+oLcafGR6yFVO4lKCTEkcLHXYcbp2wOc1WJmC6/hBDOSSFjVqX8sBPze+u+Ls1cM7WeQrWPkUiYzCtr9v+z/11Xgwg49p3L/Uv69aXxh+9ra4N/JJDpZNamMlXlSK3mkLIJIVklDiQvRv00QJ/5GTp63RH1gGbW1vuOxcF+1eQCLtni2rlww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THPZ5GzFJKpKhG8aWRQn2DOsYEcdVkF+TIsb7q3X3s0=;
 b=gW6R98Tbx29shrybgKGwfWzRZJMZpycaLYlKVvmnhxpdcG8Nmme8Kj47KFmGFn/wL/oO7tCXpu0b5P3s7J81UF/HoGh2XhYK0MtAaqYKtWnMKCRwP+W8x2AQwqZbg5xmv2DEWeVCi6X2x5NkGdlUJZUlgStfCtYTv9IArgITAisRsI8Vj556Nk5CDQIklJzgwC/2vrvoVfcAz6v6ziT0/TMpJpR5wY8KzH21ZgNLwOMnZ32QIglcMbIjNFz2X5epXRAi+dm7ktA4sw6PmL7MWphtCtQ5vQboumeqhHloy2beGOU5RJYhWVyE4IUu6EegS7EhZFEVnJqL7qemMhO13A==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 15:01:11 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Sun, 4 Jan 2026
 15:01:11 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Index: AQHcb86jUh4zxo0ySUOi4HmApuhn2LU3ZAMAgANm14CABx1jgIAAThEA
Date: Sun, 4 Jan 2026 15:01:11 +0000
Message-ID: <253ce3926d61cf4ea0993cbf8422dcb56e9e544b.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <DFA1CUMND2ME.1D3PAJW641QHM@ik.me>
	 <802504957624510a92a4b028a2d5c4d41f1ee6e1.camel@nvidia.com>
	 <DFFQALP7EVRX.TFWUBO31C9IH@ik.me>
In-Reply-To: <DFFQALP7EVRX.TFWUBO31C9IH@ik.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA0PR12MB8087:EE_
x-ms-office365-filtering-correlation-id: aedee418-a526-4dee-f1b6-08de4ba2194d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UW4xWGxrajZVSFlpN1NmSWFVV3BOVzBIOEh0Qkwza3JkZzlMd0ZhQVlsdWJq?=
 =?utf-8?B?cGhxUnd3MWdHSTFTdjBUaHNDazV2T2lXM21LRjVORExqWDA3WGdnOEJDcXJr?=
 =?utf-8?B?SEtaUGZUUk9uNzdhcDd5ZFcrMFh6eERsNkorTDhNenFaVUdnZGVHQnRrTVBJ?=
 =?utf-8?B?eUxYemQvOWRUK1NkZWlSM0NsdmxzNThQb3RKQjhzY1dvQ3pqNzRCN1VZY3pD?=
 =?utf-8?B?cTMxRDExSE9OTDhERnorbnhwS2dZRGpha0pYK3BtRUJ4Y3BEY2RPVTJ5emQ3?=
 =?utf-8?B?aEFzejB6d2hKMG93UFI4R1A3UU9Pek8rdER0cHByYnJMUkZPWnRlakVzMmFW?=
 =?utf-8?B?WkZONnRDUHNKQnZhS3NJQ0dDRVViZ0dJY3VVYmxtbFd6YUM3ZVR4eDFGN1Bt?=
 =?utf-8?B?MFJob0daSU1VU1UxQmZkdDdDbCsySmNKdk9KTUMraGZqbE5OZ3oyZkhNYnZy?=
 =?utf-8?B?bTJaaUdNdGtYSXdiTDV4OU15M2R5L3E4amI2NzZsMUVMcGpTa3R5TzdSM1Na?=
 =?utf-8?B?MVFSZlhoVjJyRmFFUXF6eHdGSmdhdHNPMENPelNxRkNpa08rY3RFczJjQ0NJ?=
 =?utf-8?B?Vm1TZE5xYmR0TVFxYnBVbjZSWnVwaWpzazBKaHBDdmRTRVNXQUZlVzJ4RUtQ?=
 =?utf-8?B?bEt1cmdnVUk5cnFsdWc4KzIxQnoxYWFzUDRmTEE2V1k3VmFWWm8rZFc3RU1Q?=
 =?utf-8?B?Y0pxdURtQVBMYWhINFRNK0ptZjRkL1VJZ214WWtPSkd4MU13TVRweXhid2Zj?=
 =?utf-8?B?UnMvejBBMTRORytscXZncmlTekZwSkFzbzNsdFc0dndGejVXS3QvaUJKMVRT?=
 =?utf-8?B?MXpmQlJPMmE3dXdTcndOMVFueTJoZFkrMmhUVFRDWGxCZnpVdzBxVzIreUdO?=
 =?utf-8?B?MWt5S2czcnplclNmNHFSbDltMUN4QUs3M2FKM1lJY0ptVnlxalQ2cFJBVkh5?=
 =?utf-8?B?SjNXVTVmejRTOE9MZEdGZm5xZDJTYk5mM3RPYlVEeXFTT3R3aTU0TlpKMDF2?=
 =?utf-8?B?NVBqQlhaV3Fka001NStCbkd3OEloN2dvVjBHOE15NkVNb1pxa2FIVmNIYUZG?=
 =?utf-8?B?dnZPV0c5WXhDUDhqUFhRZDVpMWxWR2owdFlmQUxnaFZMYzk3Z1dEN0FabkJh?=
 =?utf-8?B?czJ2ejZOQWNsSEV2S0JrUFZRREFwNDJiWE5GbEJxVUhqNlhhdXlSKytTUjFW?=
 =?utf-8?B?aUtlNFdRTjdidHB0Y3JjdVpUWkFWT1VYc21VdGVMeWhMZk9VY2RsWWpuS3Jw?=
 =?utf-8?B?RG1kZzZZOXQwS2lybGtMWitQSUU0WEdxRE1YUmlVWnVhKzBxMm9ISHdjV2Rq?=
 =?utf-8?B?dG90OC9BditZUkc2dWtwWnhlaGVmUTc2NkFvYkZhdDJOaVlka2lrTk1NbkdY?=
 =?utf-8?B?dVI4UWkwbTdBZFpMaXRsNi9DeVNwTUhOV3g4dHlLdVV1SHczZm5CTkJyOFJT?=
 =?utf-8?B?dW10VTQ2WHpvbVJwSlNISm1kdEtoakZwUFlMbzRISnhVSTZ6cStGT1ZaTFEw?=
 =?utf-8?B?NGlLc1FVVzE2ZjZZQUNxVldUaURNRHo4dTJqSHR1YmhHOUR4SFkwaFp3TVhV?=
 =?utf-8?B?OUVWRkQycmxSK0pVVWR4VGJPU1J2OGpFZnNOcVNCMHF2WlU0Slp6d0UrMkM4?=
 =?utf-8?B?NWZuU1V5cGFMSUlRTDVlWXNiOHlzTTRIb2pvd3dhR3FQQnRoUUFYUW5yeGhK?=
 =?utf-8?B?T1pIM0ZwbUk0Ulc3WllpZExRZk9yeE1DWHpTQkkya2xFL3I4alI1N1poZGVM?=
 =?utf-8?B?eTFBS21tVHcxRTlhL2ltTXJ3VTIvZ3FIU0U3QjNOVktzYVljWUx6MGMvOHlI?=
 =?utf-8?B?eWZUNnFka1JHcWk5cDE1OVh2OEhMSFV3bzNxQkxMNlZSWjBMU1pvSElscnpC?=
 =?utf-8?B?Q3VjWGpGOVNwSjg2dmp0RFZ2blg3aXlWSEN6LzlZN2FJKzJ6RnRCVHVmRW10?=
 =?utf-8?B?NU1nNEtYWDVQZkdoeEJURjlzMUxETXY2K1FTWkYzZjVWY1pMc0tXa0l2Sjds?=
 =?utf-8?B?aUVwbklGc0szVTdCVW9iU1NrZlZtbjV0VkpYRmVBTGdvaEU0cUlNcXorMGxw?=
 =?utf-8?Q?tHzfIE?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TmZpR3k1RmtlMXV4dlVOVGo5UTZiZHA2WFRuSXZ1bWpGUUMwWDBLd1FCdDBZ?=
 =?utf-8?B?T3oxWlZqYkZha3dKVzJ2UWl2dHdFbHRiYWRkNzZLZlc5azN6blhxRHRtTmlG?=
 =?utf-8?B?RUwvRVZkZDQvdHU2NGx5bmxDLzhRK0hxaGUyYjBXSVk0ZmVQcVUveEtNNTdO?=
 =?utf-8?B?SW1CV1V2ZndFYWxhWU8xWkR0NDluT1EyUnF4Nm1EU1Z6VStnQ2xYcXlYUnVl?=
 =?utf-8?B?RVBiNXp3MDBrWHBldmpuK0EvT0cvdHdLRnBVcURkTVV6dXBkOGZiblJHcE1s?=
 =?utf-8?B?Um1EeWpUQlZ4YWxyMmNhcEtEZHVCajZTNHlqbUw4WmlQaWVtbmM5WmVkdEQ4?=
 =?utf-8?B?WVFTcmVhSHZVb050U09BUWpKTEZ4MERpL1U5dG0zRXoya0xCcTRwVEI4YXo5?=
 =?utf-8?B?aTBBc3BKcUgwaDBPSEVWNlZ2UitFL1NqaDZ4U01XYVRwTjY4WkZRajJNbkRW?=
 =?utf-8?B?YnpvbHYzaE1pWXBORytpdnhDb3JrN0VMSWtRckE2R3RYQlBCT2lhaUI1V2ZV?=
 =?utf-8?B?YW4vaGFmQTIwb0J2dW11M0srRHFqWStrSFFyYzluNXpaU3hqK3Q1MXhrSUJL?=
 =?utf-8?B?SUozT0RhYyt5L0RPRFlMbm9xN29xVFphQlRvN2MvSDhqUmkyMWs1bWRRVXhC?=
 =?utf-8?B?cG1Xemg4aXNJOEFQcW4ydm1XSFJrMTZneE9KSkk1aUNIKzN4YTlpcnJuTXpU?=
 =?utf-8?B?QXZZb3RRS3h0QW9jQWllVVVPMkl1UUQxT2l6VDlyZi96cWpON1FwbVFXSVc2?=
 =?utf-8?B?bWljOGJMZzVOWmtEUVF3Y3JTWTFiSlBrM3RzM3RZbTVsTDN1SXk5cVd3N0s3?=
 =?utf-8?B?S1M2RVB3Qi9WV3VWL0paY3hTV1JHRUt0ZHNrUGJmRXNOeFc4SXloczQxdmgy?=
 =?utf-8?B?SURtWFVqK0lZcGJlRitmbEJtWWpRK1pVMDE5bE13R2UxRmV2T0RVMHdoRWEz?=
 =?utf-8?B?VSsxQklQTmxWcXhMam9PTTllaVBUaWdwcjZCM3FIZXZ5NGw5c1ErUUFEKzVX?=
 =?utf-8?B?a08ycEhXUFA1ckZqeUZycjhiQWVXZ1p4dFRYYXpOVUtsZ0ZjVlBLODZyNmNG?=
 =?utf-8?B?ZnBkMUtBbXo2dzlHUk1Dd2JTTVlkT1JyUzNsMzRjemZQMURWUFIwZndqQllI?=
 =?utf-8?B?MEJuUEFuZ0tmMVYrM25kcDM5N2FTbndCOHo4R2djSS9PZ0l4SkNUZm1YbWJM?=
 =?utf-8?B?Qis2c3ZmUnNHR1JXbmpab3VLWElrTWw4TWdQbFNReHBFdFRqNTVwckFGVytU?=
 =?utf-8?B?dWpobnY0R09uMklsakE1K0tTQVI1ay9QVEJqbHVMK1FQd0pXZEUxdkxxKzBR?=
 =?utf-8?B?ZnlqUDFlSDRneFJubGJ0SWFteURlaHkwdXJXQ2ozRWUxdDM4amZkdGdydmVQ?=
 =?utf-8?B?WkptSjJCYkwrcmVHdHEzVHV1akJabkR2OHl2RkN5T1plTzFLTTVpZG5YbXVM?=
 =?utf-8?B?UEkweXB6MXFkeTZxdWV4NHllR3NBMHYyOXpoLzRKeHhxUUFsaVl1TjczYjd3?=
 =?utf-8?B?V1pUa2VzSTZGYXpPcjhqMks3OEo0NjQ3a1AySk5ZbGhIRU42MHduemp5d3Vp?=
 =?utf-8?B?ME9HRmZMZy9HbjAydm9zRWdjb1JMdk0vS0VhOEMveHVxQW5VSWlmd3lJak9N?=
 =?utf-8?B?a0hubXRpOHloQTRpRC9sUCs5S3huK1hpOWU5ZmNFU08rOHJnY2F5T2JnOGRq?=
 =?utf-8?B?bUhUSmxBaUFLbXR6RzU3L2hvc2psaDVRSkRxQXFxOUVLNzZlYnI0MFkrMksw?=
 =?utf-8?B?RHhhckdQL1lRb0VnUERqTDZtSnVFdGxITmlMT0UrdEp1bUo1TGlQT3FQTE1j?=
 =?utf-8?B?WEIxV0w2cXcxTHNVaEtMejJXTXFEd3F0ekdlUVVaY2FwRXRxdSszeUU3QUt3?=
 =?utf-8?B?R3h1UWVjRGdzSnpLMEo5MmwySEhqNDl2TzZFSkRXcVIxb2xYaGtvREZHSm5S?=
 =?utf-8?B?QUtQc3JxVmtSWmNIck45YXZhNzB0TU9KaU14WG80U3lJOTZxd1Y3OVZvN3Np?=
 =?utf-8?B?RHlSMjh1eDlCUkhqMHhOd1FsaU12M0twQys1RzdNS3NJMFdkMlhSMUVjeTRQ?=
 =?utf-8?B?Zyt5aURaajBxUEs2eVl2SkNBdlBZYzI2ZWJOVUY5OFFha0l2TE1sZnFqaXBB?=
 =?utf-8?B?WTdnc2hTeFJ5MjVvdE5FdEtDQ0piRnRQcWVBK25makVUbEVzSExhV1pVbEFL?=
 =?utf-8?B?a1RVL0dBeXd6ZnBMVkRpWXk4RUVIV0VqZm9hL1NFczI1WU1nbHhCMlB0WnVs?=
 =?utf-8?B?QW9OUkFFRDZLUHAyQlFJb2xneGRsZDZNS2VtZVRYNFg2S2xaUWU3dThORkps?=
 =?utf-8?B?ZXZ1OFArNStmbkpSeHhIdWhEY1I5cHdzM1pZc2E3UGhoWjU3clpwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7C000F4CBC05B4DA44B8183677B9E8E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aedee418-a526-4dee-f1b6-08de4ba2194d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2026 15:01:11.4367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 SvAM5zCCZc0VNtFBzerAASsDl78qbM8oH54r3Bhre9b2RxUbvQEWYKW2wXT1JIa2eGBpSUl5jAek6lPBw88afg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087
Message-ID-Hash: F6MSQBILWJUSGC777OSZF2Q6H62YVWZH
X-Message-ID-Hash: F6MSQBILWJUSGC777OSZF2Q6H62YVWZH
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F6MSQBILWJUSGC777OSZF2Q6H62YVWZH/>
Archived-At: 
 <https://lore.freedesktop.org/253ce3926d61cf4ea0993cbf8422dcb56e9e544b.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU3VuLCAyMDI2LTAxLTA0IGF0IDExOjIxICswMTAwLCBFd2FuIENob3J5bnNraSB3cm90ZToN
Cj4gTm91dmVhdSBpcyBub3QgcHJvYmluZyBlaXRoZXIgd2l0aCA1NzAuMTE0Lg0KPiANCj4gW8Kg
wqDCoCA1LjYxOTA0OF0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IGdzcDogZmlybXdhcmUgIm52aWRp
YS90dTExNy9nc3AvZ3NwLTU3MC4xNDQuYmluIiBsb2FkZWQgLQ0KPiAyODU0MjA0MCBieXRlKHMp
DQo+IFvCoMKgwqAgNS42MTk0MzFdIG5vdXZlYXUgMDAwMDowMTowMC4wOiBnc3A6IGZpcm13YXJl
ICJudmlkaWEvdHUxMTcvZ3NwL2Jvb3Rsb2FkZXItNTcwLjE0NC5iaW4iDQo+IGxvYWRlZCAtIDQx
OTYgYnl0ZShzKQ0KPiBbwqDCoMKgIDUuNjE5OTQ0XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZ3Nw
OiBmaXJtd2FyZSAibnZpZGlhL3R1MTE3L2dzcC9ib290ZXJfbG9hZC01NzAuMTQ0LmJpbiINCj4g
bG9hZGVkIC0gNTkyNzIgYnl0ZShzKQ0KPiBbwqDCoMKgIDUuNjIwMzUxXSBub3V2ZWF1IDAwMDA6
MDE6MDAuMDogZ3NwOiBmaXJtd2FyZSAibnZpZGlhL3R1MTE3L2dzcC9ib290ZXJfdW5sb2FkLQ0K
PiA1NzAuMTQ0LmJpbiIgbG9hZGVkIC0gMzkzMDQgYnl0ZShzKQ0KPiBbwqDCoMKgIDUuNjIwMzU2
XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogZ3NwOiBSTSB2ZXJzaW9uOiA1NzAuMTQ0DQo+IC4uLg0K
PiBbwqDCoMKgIDUuODYwNjMxXSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogc2VjMihnc3ApOmJvb3Rl
ci1sb2FkOiBib290aW5nDQo+IFvCoMKgwqAgNS44NjA5NDNdIG5vdXZlYXUgMDAwMDowMTowMC4w
OiBzZWMyKGdzcCk6IG1ib3ggMDAwMDAwMzEgMDAwMDAwMDANCj4gW8KgwqDCoCA1Ljg2MDk2MV0g
bm91dmVhdSAwMDAwOjAxOjAwLjA6IHNlYzIoZ3NwKTpib290ZXItbG9hZDogYm9vdCBmYWlsZWQ6
IC01DQo+IFvCoMKgwqAgNS44NjA5ODJdIG5vdXZlYXUgMDAwMDowMTowMC4wOiBnc3A6IHJlbGVh
c2VkIHNlYzIgZmFsY29uDQo+IA0KPiBUaGlzIHN1Z2dlc3RzIHRoYXQgdGhlIGZpcm13YXJlIGl0
c2VsZiBpcyBwYXJ0IG9mIHRoZSBpc3N1ZS4gSSBjYW4gc2VuZA0KPiB0aGUgZnVsbCBib290IGxv
Z3MgZnJvbSBub3V2ZWF1IGluIGRlYnVnIGlmIG5lZWRlZC4NCg0KSWYgTm91dmVhdSBkb2Vzbid0
IGJvb3QsIHRoZW4gdGhpcyBpcyBhIG1vcmUgc2VyaW91cyBwcm9ibGVtLiAgVW5mb3J0dW5hdGVs
eSwgbG9ncyB3b24ndCBoZWxwLA0KYmVjYXVzZSB0aGVyZSBhcmUgbm9uZS4gIEVpdGhlciBib290
ZXJfbG9hZCBib290cywgb3IgaXQgZG9lc24ndCwgYW5kIGVycm9yIDB4MzEgc2ltcGx5IG1lYW5z
DQp0aGF0IGl0IGZhaWxlZCB2ZXJ5IGVhcmx5LCBiZWZvcmUgYW55dGhpbmcgdXNlZnVsIHdhcyBk
b25lLiAgVGhlIG9ubHkgd2F5IHRvIGRlYnVnIHRoaXMgaXMgd2l0aA0KYW4gaW50ZXJuYWwgcmVw
cm8uDQo=
