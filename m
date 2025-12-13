Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF9CBB3D9
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 21:47:17 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2692210E408;
	Sat, 13 Dec 2025 20:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bqrlmLgP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B9C4745177;
	Sat, 13 Dec 2025 20:39:55 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765658395;
 b=UpD4OHJ8HcRDO5LOCOgNe9zWSm41FQZhAiMMN4bolNYXFNgXolxCRismApbhO8mMaIhhv
 ElRNiaarDWpIFh1X+BoWPlJpqQ903JVbTfRkKI5bUq1J2wwQnnJRSvGpshReLYI5WIWEjtO
 yjUfgs0Y4yXeGFzk0dmaxrymopWihNIQz9cxa2XhNtDhlvJe08bx+Vg+fOVzkvst+6ecJ5y
 aB5xop/a0YhpejGDYB65RK9M1GUrWzaj1BoAKZ8FwUt6sWd/A7zBQwL6yMutazlNH715/hi
 JNSJle4aep+sHRdSfFFyNcyVh0WGDH96q7DHCaj+71ncACysvpMu5Nh/lpgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765658395; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=F+nPhQdG+MAaCnRRyA/OzqL/dylRYUoztUR4RIdmQPY=;
 b=q25KpS11RtmmJ8ZZOJyNNVnPfrtMkQ8WP+sl5nQ7ZbSX90A7C3TOXMAWZN/a9meMCVojx
 szaT+h6R6NhGILpJ04Q1PRtjNCmq6a2KYTYb2ehljswlSeKmE/rJjdblaJjLRF8+ac0DfZu
 RTJVLI9efHrMJEXNRPCLrha/0I1+ClvXYFaU8ilPsq2LSPHvj9ewbGZPq8cD8Utu4lXvfT/
 LczNXvLC75lzRg96zzqjuxrxy172FscEq6Q8r6Owj9nK65N99ayahkRJ3v4LL73KNNh8cCB
 FbbUOD6215Eln/4L3CH/IwJoK0Tw+PtDdAdiMvAZBmlTjkwGfp45xqasalxg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A24A450AE
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 20:39:53 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012049.outbound.protection.outlook.com
 [40.93.195.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4D10E0F8
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 20:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZ/VcyPBAkQdADh9IP55znanhMHOIPYZCOy8qlC8QjurDJcZpiiX1YlrFLJ9ScUCCi+Tv48hhT5yxv6EAWO+r8dVz/bgOMtdkKy8K9WWzdAcsrx8vtstC7aFMJq1E30vZeChkr5s8dpoJXapDdsfXt2DXBHjKIxOkKcQxIAXApb4KBv9PVVnMchwoR/DErFaBBg4mAEtN11X661kBfB0gSTLDj6vj1JTDVTGcI1lXNFbtJeQ8nmI8EfD8+VFXnMXbASJWYAMKztd2JlaxhMj+whlhr0o/S7Va7k/Y4yha2uIq4yRK8LUAC5mhn3qtmuxBkpCeHo9pfEyxE/VjYH7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+nPhQdG+MAaCnRRyA/OzqL/dylRYUoztUR4RIdmQPY=;
 b=IJHU4RqOygiEYBVnVMlqPem7b97zuBWB5GsAd5pb56PNSayt9wJpXPgrFCG6tZ7AyX9d6GR8VnjTEG2UvfO5+ETxAz7lk6k+90zhM/FAS4WdwaXZpWbAfsBWLcEcNgpH0+bMxQOh/ySkhwiDPBM667+12bgJZHHiFHHVa3rgsWmbTKysSWo+cwPsoewzhJQoDCsi0Kxh31RGKI0amwq6STaPAWUc2hQ1e7sJZe3O/sePygJWkuCtkH3/t4k1yjNuKLdzSkJea0+esnDrNOmy9aoIoExU/ZEUMnkKVcb988+nfRIZ71O3qEaelEstuSx+a74QOvLsOOh/Pc5wmGuS3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+nPhQdG+MAaCnRRyA/OzqL/dylRYUoztUR4RIdmQPY=;
 b=bqrlmLgPXNrqapbRMc+3Sa8rDkaOSnBxWbmYFcFQLpl22M6T5U0EXihdI2gsACaoYwjpnNTe68pXfShweM7Jd0m5wHT7qcracKVLwM4uEOGjGmelorX35AxanbLEOOY39kqt266PlSuOnxJT3ZkbeQ67uE1+Sg4Bocn+6WGm7gq+bQLepb9wn/1KzfJZ8/6IbzWdF/XMQ3MhMyejG4Dlj1bexuCTZD4YfDVxWMh4EPb+JgrFFSI3ttcBQBeuei1jFFrUpt5n36mNCx+swK58Zsp2YX1VowG5MdqZb+GowxuBjzEl3fnaaoWhHgG3y5Wklj/tITohNmb8+jLjtZd+qQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Sat, 13 Dec
 2025 20:47:08 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 20:47:08 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Topic: [PATCH 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Index: AQHca6juWbXC5YnanU+5EaVRRTOXoLUf812AgAAYm4A=
Date: Sat, 13 Dec 2025 20:47:08 +0000
Message-ID: <9d811a1cb846fb1cddbdc8c037587bec2cd296cb.camel@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <A398B50B-0D35-4DE4-B6FF-E434608C401A@nvidia.com>
In-Reply-To: <A398B50B-0D35-4DE4-B6FF-E434608C401A@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SJ2PR12MB8062:EE_
x-ms-office365-filtering-correlation-id: d2833363-2ba2-4fb7-7e84-08de3a88c82b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eUtDOG1ObVljSWFQN3ZRbVFSZjBhVXRBVmZ5bjBVVWxkWkYzUnFRZER4QXg4?=
 =?utf-8?B?VVhXWWU1ZU94ajhCYVQvZHNrL09ncGlTTTZTcXNEWkxmYm9SdUpBc0hIVjFa?=
 =?utf-8?B?Q2tTendkR1BURklGQnhPOUc0ZDE4SjdtVDN1T3Z3NnV3U3RGUFlMbHBoaU1h?=
 =?utf-8?B?dFh1MmdRV0tlZVZGams4MTdtYytMZzdQM3JZMGp2NE9zb2E3SlBPTmR3Snhv?=
 =?utf-8?B?RzBsb1NaTTVLVE1ieGNEOWRkQ3hIbjlwS1hUd2xmYTczS1laYkd6bWNxejFR?=
 =?utf-8?B?RU0xTUZuVkpCcjVnQ1hhL0toZ0tmV0VhRDdQOXpxT1VHU2ttTjFYQ2VqbVpK?=
 =?utf-8?B?dmYzanZJTHhsOS9pRVlXZkRFZERFeW1PY09OQmZYZ1JMQ0c1MlhnVEJ3dTUz?=
 =?utf-8?B?YXI3NkU3Umo0ODFjL2lPUDh4cEltUEtiY3l4SGtaMi8rbU5XVENPdjh0bEtl?=
 =?utf-8?B?SlBkN05vU01BZmR6ZCtxUHdWOVVwbm9wMGg3RDcxa0RkVWNidWZCVWtZZitZ?=
 =?utf-8?B?ZE0xQzArQ05mSzNzOTRoZTdZR2NZLzFiU1JJbFR2dmlrZWk1SnN4RWdUWVgr?=
 =?utf-8?B?WDZ5bmFQZndtaHYvMjFZLzdJb25iajErR1VLNFYyR3M5WlFCSWdIZXpsU003?=
 =?utf-8?B?ODRYcUhtejZGdGdqbnBWZ1VudHpCdEdWTzNyUHE1S1VxMVY3dUYxeHE5RkpX?=
 =?utf-8?B?UEJwM0N4YllMQVdjNVNSV2prVWRzRVF2UklXdmw3NGhLVW5GSWJCekI5UnFM?=
 =?utf-8?B?RUFLelJiTGhuYWlTc2Uza2VISzdjT2VBNHljQVpLMCsyeWVkcWNMUmFCRVF1?=
 =?utf-8?B?d1hPd0QzRGppbzRUUWswSWpWWUc5c3YxUStmQ0M4Sm5xTmRUY1dvMWhVRDlv?=
 =?utf-8?B?dCtvenFRSlIwcFJvSWJmaE11bFBWMEgzY1h5cTJjU3ZzSXRtcUdyT2dodUZM?=
 =?utf-8?B?dVNvcW1DRXFaMFpqTUJhV1h6cWg4NVl6NXQ1TjdScGoyNFE4dm5va0hvMUlV?=
 =?utf-8?B?U2dKRCttbS9IMVpZbXJNTTlGanpoTnJ5VVRoNWdZREprYTg4S0s5Vk4rNVJY?=
 =?utf-8?B?a1o2MFNmNzNXVDgyU2pwL0xFUnUyeXppZTJQRTAwYjJJUUVtMWVTUGRQVGsx?=
 =?utf-8?B?N09UUXB6aC85d2l1MUpRRmhOa1ZnTWxIVERrZU5GRytVcXp3VGpEMHpYWlcy?=
 =?utf-8?B?MFQrclZ4UmpBeFlIeDlSdEhpUnl3Q1dlemU0eDhEcFR1cWR3M2NaT1ZzMXhr?=
 =?utf-8?B?TWJJeXpYQWsrckpYZzBhTENOS2UwcUpSVjVQQzZkYXR4QXM2K21aY0k0QTl2?=
 =?utf-8?B?S2J2V3dqQ0YwZFJNTzhWbkhRWlF3NzVyRHhxa1N5QnlpNVB2dnFSM1Y0OEU3?=
 =?utf-8?B?WVJ4QzFvYWNMa29BbGswdlpMWUZQMFJKTExrUTBSK3FXSFNJMjRBMnBhSTc5?=
 =?utf-8?B?bHZLYkhiOURPek1ldU51QVpQSFIyckJIRS8wNXhxc3I3aUppVXUvL2xnWEU5?=
 =?utf-8?B?bkRORHNFOHJkdjBEeUNhd2Y5MTgra2xWUUdUNkRjMXZhVXBPNmFNSTVTcktJ?=
 =?utf-8?B?RXBZVkY0MzA1ZzZxRDVhWTRGaGFYWThVMkpCQldidHk2THJPZi93ZzJZV2x2?=
 =?utf-8?B?WnFhMHVabW4zRVM2WStZcFIxSEJGMldEU0lJRjVuZ2c1elZTaUZjdFBEdkls?=
 =?utf-8?B?MHNwbE81eE1malh5bzlVTU0xbGYzNFBaQzduQUM2NUNKUHVLNVhsMDU0NzN2?=
 =?utf-8?B?Z28zQnYzdDR5QktyQWRvODBsUkRUZmN4Um8rdVpqTFpkS0tkaEpBRlhOZzJU?=
 =?utf-8?B?cXdDT2FqbGw4akJHaFd4RFYyZlUzb0cyWG40ZmtLNVlMY0hMRGpnQXRIVU05?=
 =?utf-8?B?QWNmK09GNk9na1lrZlBGamx3N203clBTQ0F0eTh4cTVxSk5WeHoxdFpkZTNr?=
 =?utf-8?B?L0FCKy82TzNQSVZycU9vNmwxZGlubXBkOGFQbUp1WWtIemtCWkNBQVhoN3FP?=
 =?utf-8?B?WWVJWXdZMDlsT0QwTS8zc2JqN2dkLzZmN1RoUG52cVorNkNVOHBwemlaaGYr?=
 =?utf-8?Q?Nf6jSh?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WkFTMkswS3Z3MVZSMmdrZzRsNDhhcnFOY28wYjJvenltMjZEMjNxVTlYdTJy?=
 =?utf-8?B?cDA0YTJrY21WU1lJWTZqTFpLUHdtZGZXS3FaYUpmaXFhbFg0c2Z0VGxyV1hF?=
 =?utf-8?B?eWNOeExQTTFSZXBWVU1BMS8zMGVnL0pwSVNuOEFaWi9Xa3pyMUptdUVUam5h?=
 =?utf-8?B?OXptdzFFQnlBaXVFWEhZb1h2alVtUldYa2ZRSDNQMFBBUEZPWkdnb3J5OHZn?=
 =?utf-8?B?SFpRaFp6bUVRWkU0NGpCV1FDZFQwYkxOcjZUVzZSeDZ2NTdXZGw3Z3RSVTY1?=
 =?utf-8?B?WDMrRTBESVd3bWVPWDBQOFdOdHkweGxKUGFlUEVURy84MmxOVmlaWTJlNUd6?=
 =?utf-8?B?T3Z4UFFzTm1rS3pReTlSZTl3VlRPYjZGMnZFWVhSd1BZbFZlTUN5dVNQL2tr?=
 =?utf-8?B?NytUKzB5UXJCdUljUG1oTUlpbWQ1dVplczFMNmZ2dlYyMTlDVGk4ZTI1WXA3?=
 =?utf-8?B?SC9HaDk0UnlpbFZ2RzI2Tk9KYUFxQ0dEckJoL1hJLytkL0FRSXlHMHFaeGVD?=
 =?utf-8?B?bkNjajgvNlR4OHdGR1V6TWVRNVJIdDJwZThjekdZckVxVnRTd3JUQmMva1ox?=
 =?utf-8?B?TEU5S295RnFzdFBJMVgyYk9reWJ5dU54SGpSd0pDNlROQ1ZGeUtlNlQvOWhX?=
 =?utf-8?B?djdmZTNGTXNFTVo5MTRucUJJTmVjVDc2UkFCTklOY3F6RUJVV1gzYlZqU1lr?=
 =?utf-8?B?aEptMC9sVDZ2aS9QSDhnZ2JXbnQyUm02bC9DbUJzTmp3elQxcENjVGhiSEcy?=
 =?utf-8?B?UnVuckV0Q2RzU2hBQThYU2t1YXJjMTdJZVF6VDVwVTlsWXpvLzRQYlVrL21H?=
 =?utf-8?B?d0J4UU4reGhSZ2lwSUpicEQ2T3NucEJxbkxqUUtObkNTSW9jaCt3eklUcGtW?=
 =?utf-8?B?L2RGQUVkU3VWM25LdVY0SXpXZ3B2YjM4SmlIQkR6U3h4Ykl2TmdjNW9aTkJG?=
 =?utf-8?B?QnZyTFpKVEVXN0JUdlR6eC8wSmN6QndBcHE4Mi9FY1V0d0RVU2tiNDdYT3c1?=
 =?utf-8?B?ZlMwS2lZTUMzM3VNdXZOcThQYkM2aWJQd1Rpano3VmMrOTZzSjdXT2h4K1lS?=
 =?utf-8?B?aFVYbStJckNicEJFMGswSnBoS1BtUW94L2x0eldXRUNEa1orengxNFdPOWw1?=
 =?utf-8?B?Z0RaTk5xQ3VWWTBGNFNZclNXS1B2all0UDMyeWJCclRhU25TOXZUdlBkRXVt?=
 =?utf-8?B?T3Z6UDQwSVg1NHcyenlCaEVRbHZWWlFNekQ5eXlHRmNiVXAzVG5WN2FMY1BL?=
 =?utf-8?B?MUgxOG9QVVdMcmZoNlFvVTloTmxaSFZodlhMTDhkN0s3RHlSR3JobzhOTWJh?=
 =?utf-8?B?U05yQnZrdHkxalFtMkp6Z2FFMUpvbEFIUHRvUWpaV2RsOGFEenBvdjFWK2dr?=
 =?utf-8?B?elZ2MzhrMTJ3aEJCZEtWSHd1N2RuTEJQTHNFOEo4cWVHSkxvK2FXQXY0cFFR?=
 =?utf-8?B?R0pJS3RKWnNKTzZ6bFV4WFd0ODNmTEZrT2FWVHl0TzdqcjJUendueUNLYlJY?=
 =?utf-8?B?cnF6RmtOM3ltSnRKc0NaMTlBTStHTWZwaEpqeE8xaHpzVjU1NS9UTURoNGsz?=
 =?utf-8?B?eWkxZWdWVEQ5dGJoZ1Z6dzAxYXBVWDdqdnluWFJWSjU0RkwwYkFTYnpWMndk?=
 =?utf-8?B?eENKejMyTU9BTVhjWVl2T1ZuQzA2bnpmUWIydE9WTnp4clZlTDJaNUJuM0ZC?=
 =?utf-8?B?MlRHNlEyeWRUbGJUTXpBeFlKbDAvUFp6cmZJNlE5OGhSeWw2b1FzL0lNL0dI?=
 =?utf-8?B?NmY1YVllYkpRM2JIWm5qeXU2RDVTdjNxNzJhdFNEWGRGQmlyZmV4OGNnZGlY?=
 =?utf-8?B?WE9Ka0dCbDA3SUMzVkkyS0VNcUsvOUpZWjBmTzBvTUE1NitFUEdhaUF5dndP?=
 =?utf-8?B?ZlBDQUY0WDhqOEd3Mi9lNWxPWnp5ajQ3SVpuYi96dTAvY0NZTHRuM2gxUisr?=
 =?utf-8?B?MjhzaEdoa3I0a3B3Q3pmdWUrZlFSZkVrTHpJTWJCL0k4eFhZdjVYTWFOSDRw?=
 =?utf-8?B?Z25VUC9wdXc4ZUxJTDFzOUVBNEZnM3FVWHNNTUF5TlZZVXJwNjhxWXRraWtN?=
 =?utf-8?B?OW5wMEZzRmJpSytuUUFVb3VjL3crWWx0b3Q2eVBITVA1eFlMMDlWNWZvNHdt?=
 =?utf-8?Q?9ZYyVxtPyuNa+ay645Rnxor37?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BCFA6264E36044EA2BB9F8C98E19E01@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2833363-2ba2-4fb7-7e84-08de3a88c82b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2025 20:47:08.1277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 LP1MEV+cEa1/0gRB2UBDkHUAtHox7rEP44YZn2qC0qWOCT8V7NERQ++loRIgtFa9f4PZRbzd2TfJzaIOBRqOIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
Message-ID-Hash: 7CBRWBHLIXCERSLW4G5D2BITJPNEJ7AK
X-Message-ID-Hash: 7CBRWBHLIXCERSLW4G5D2BITJPNEJ7AK
X-MailFrom: ttabi@nvidia.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7CBRWBHLIXCERSLW4G5D2BITJPNEJ7AK/>
Archived-At: 
 <https://lore.freedesktop.org/9d811a1cb846fb1cddbdc8c037587bec2cd296cb.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU2F0LCAyMDI1LTEyLTEzIGF0IDE5OjE5ICswMDAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gPiBiYXNlLWNvbW1pdDogMTg3ZDA4MDE0MDRmNDE1ZjIyYzBiMzE1MzE5ODJjN2VhOTdmYTM0
MQ0KPiANCj4gSSBjb3VsZCBub3QgZmluZCB0aGlzIGJhc2UgY29tbWl0IG15c2VsZiBpbiBhbnkg
YnJhbmNoLiBXaXRob3V0IGFueSBtZW50aW9uIG9mIGEgZ2l0IHRyZWUgaW4NCj4gdGhlIGNvdmVy
IGxldHRlciwgaG93IGRvIHdlIGtub3cgd2hpY2ggdHJlZSBvciBicmFuY2ggdGhpcyBhcHBsaWVz
IGFnYWluc3Q/IEkgYW0gbmV3IHRvIHRoZQ0KPiBiYXNlLWNvbW1pdCBmbG93IGhlbmNlIGFza2lu
Zy4NCg0KVGhhdCdzIGluIExpbnVzJyB0cmVlLCB3aGVyZSB0aGUgZGVidWdmcyBwYXRjaGVzIGZy
b20gRGFuaWxvIGxpdmUuDQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9sb2cvP3F0PXJhbmdlJnE9MTg3ZDA4MDE0MDRm
NDE1ZjIyYzBiMzE1MzE5ODJjN2VhOTdmYTM0MQ0KDQpkcm0tcnVzdC1uZXh0IG5lZWRzIHRvIHJl
YmFzZSBvbiB0b3Agb2YgaXQuICANCg==
