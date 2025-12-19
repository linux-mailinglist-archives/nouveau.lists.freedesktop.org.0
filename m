Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F714CCE727
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 05:34:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5E910ECC5;
	Fri, 19 Dec 2025 04:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lbZVprrg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EAF5B454F4;
	Fri, 19 Dec 2025 04:27:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766118433;
 b=xvnTKm91Ltlc02iG4QAK9zuvTzdJx0rcYnEpiy0+Et1zaR+RyEdeymKBa2rJpuRKXenR2
 3rVct1/RJdZwxGf+6fkn0XOSx2dHYlifmRclC5+yIq9AC0itK/Esex2ljDC1E83X8ZzIk5a
 2b63qu6RR6v2AW/enm+i9CvCWz2C7WmZ6T0Fpb75NX1YhyVxOM9KXbFNTZcAedrLFk8UHBc
 ajnayCVx4SCqARnwxzS+eSTrpbQdM/IXKJLUv0jUMTP4Rub8Xb0tv1A3UIyCLrAAJVacPxs
 k8zSUTb3JPP6KZBUMwS+Um6zY9gjvz357Xr9u3bGVruM+KiSdTZjbPjkqgXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766118433; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PuB/MnMdtSjvIQo/u9UXVYbtXpAJzAwo0MI5EPprZ6w=;
 b=c/ZlGZxQ6uMPKE70sw7om4bABj/qzk5pDfEnJPnY152tz9ODssc/s176/lUD7Ja06kqYK
 mhrOdxD3LzFz5bU0CneD9IY6cVMk4lpHQWURQK0n+9wz7kvPbEXoV7EDPZmWFi1H6nmD3ZE
 WJBhfpNla8b47Q1e9cW7rQavNCwOFAY03eMYIRbxJDfcZS6BrWvNONoH8m45ZQ7isIaGZg8
 hJhfEz2iM6Rdd7F4gRGJSiH4AW3+ZyXNGXWe+Z1Q/dh4YeFimOSDGMSCrtzuSt56l3ZdNPA
 NMDaHPKEAVwj6dhcNQhzyV0ConeSVUrZ3NaO2wexfH4zpcuUQGIrlKSr5fRw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CB79344B89
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 04:27:11 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013061.outbound.protection.outlook.com
 [40.93.196.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACBF210ECB8
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 04:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULG0OCyoZ/7wcu+4n8VBNgOvfsAO1MUH3Bn7RUbiqhFDFWCAoHBFfRWvkyk2XT5oj2tdGNJzvgsomreMg/wSrMzKJCJsPuUDbWFaDICil9eQWCrQnvJkghMYEngWI+6YebMA6Yfm5x+cM+pMy0Yx/OVOGb28C6J6kQl19BZD0mHLcrBlN7DqkrGtZj0jc1c16HAiLETYDdlcflIbk2eylZTh/X6a0EvRXrzL4FP+L1AzBcPIfvMCXZnpV6VQYPDf4JvumsHfaGCwypgiflijkMyM7kulak6dhDXSfXwm2oojDqy23WrtIj/9nT9GgAk4rRMu3srWROr1Ve+PJ8fQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuB/MnMdtSjvIQo/u9UXVYbtXpAJzAwo0MI5EPprZ6w=;
 b=q0/tqsRjotnIbn6n4EB4Hur/88f6uFhL88OUAT3X31kmb1iNEx7vfkhF69+SHMTZZFV801MhNDUrxnwgz1cEZs3faD8tCDZjMg+cjU+wYPdJTCc7ubDyBtVoi6tbs6Q7n6blPpdCgcKWTFsfPSEMeFE2wE1o+1A9PG0Fk1CNBQ8qdXJgbJ/ee3l7tdP+rSvFGUMwwLJZyZd50EpNjFlGSNCFsZGB+gS1KcJ3R8NMl1EWp58cniT6kIo3Om7b+oeQek5uG+6CjvHvODSsWIJLTal4+8bnQZpAmWhtulPMPxvS8Q1BF0oSp/EVVxiayUnqgVTMy5/9UuNpxSRET7dnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuB/MnMdtSjvIQo/u9UXVYbtXpAJzAwo0MI5EPprZ6w=;
 b=lbZVprrgDDD0OGBBuym3kOWGTgCg1Kx2jKPp+i707PYCgl44C9MBGXLiMTJcszeefMZGihCuK9N8k+HS5edfuvTgN9oMHOzNibw+rbX3zxRaXnRH7EVkAygPxhTchV5lTh8emU6gNOnC5pzJCMX6Rw2RepfrVq0NxhF7KM6oXGHur+SBzm9VaL9fScBIwG1kx7qRKz0QavqCuGdLdO7w/3znnBftolSVrlhVtW045d0qfoBtGMqtYm9NbBuWh/Bra8WViUdsN4HfpVhf/T7V7CDEGPd/IgyiMS0/1hMS2T/YMJrfVsMkNrb9C0+ASEK9Q5yaZ4BMehAT76UiriXfFQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 04:34:40 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 04:34:40 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
Thread-Topic: [PATCH v4 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
Thread-Index: AQHcb86rTdGJ/o51gkOMHpHVYgG0ArUnSmyAgAC3iACAAFG5AIAADkcA
Date: Fri, 19 Dec 2025 04:34:40 +0000
Message-ID: <50c97b2629dcb1456b936162d6cb4cbad8bfd937.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <20251218032955.979623-11-ttabi@nvidia.com>
	 <DF1BM2Z71OY4.246P9YGJC6J4N@nvidia.com>
	 <e7b6a0bcbeeb7312b52f0e9c755e6af045d99d29.camel@nvidia.com>
	 <DF1VSZIO9UZH.YU8SUUQ72GPI@nvidia.com>
In-Reply-To: <DF1VSZIO9UZH.YU8SUUQ72GPI@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DS0PR12MB8561:EE_
x-ms-office365-filtering-correlation-id: 9b41a271-7025-489b-bbc8-08de3eb7ec81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZHRxNUZNT2F4YlErU1lhcmhxSXRKZUcydC83Ujk0VXdQSlNuRFMvQnVLR3ln?=
 =?utf-8?B?VkR4dDhLU3F5U3VSbXFlNWo0Y0tEOW5pOHRHckE3bDJZVmZIdGtGdlB6Z2Vz?=
 =?utf-8?B?TE41SDZyVk5XcTljbERxazdxZ1Y0alZZWE44NkkrL0s2dW9RWld4b1ZXS25t?=
 =?utf-8?B?bWhEWmd3UndibDFQUGhWT0IySU5YVEZPZjVkVWxhRlRPZW1YUk5MUGRVL0Rj?=
 =?utf-8?B?R0d3WVZmay9Ya2QwREdncEJYcFcwUXhMV211d0hzUWd4MGgydGVpRGpvSTZR?=
 =?utf-8?B?ckN5aGwyQmpBUWl1SmdWQ3NuNGl4Wk9HTXVQbjF3OW9JSm52NUtiRDIwQzMw?=
 =?utf-8?B?V1U4L0RpY2h0NDhxbW5hVGl4U2xoejE1MkFiZ2I5NmNYZkdXVE94RmMweGlq?=
 =?utf-8?B?ZzJLR1A0akpOUmlOdlFjU0tjUTZ5M0ZtYjVSMXhLcGpXOXRJWmhJQ1NIek0w?=
 =?utf-8?B?SUg3U2xPN0tuNUN3RjVnQ3FaUFlLVGlzdHU1dndSLzNVcjNWejdFc3RsRXRi?=
 =?utf-8?B?OHFBdDNZWVBkZ1ptWklQK25BUi96NGtQblBxTFZPbzRZRGVpYzQwdnFvSDhD?=
 =?utf-8?B?M0R2U1VOaGdZWUlVNUgxbEJOeWZrSE9MQjUrYWlSVWpNNXFxSnAxSHVMZlBY?=
 =?utf-8?B?Y2JoTjFveXpKcFlnSTFwNENmTjNIV054TDJkYlMvUDF6dGYwWWhTbHhGZ2Fa?=
 =?utf-8?B?eFNLUUxiTjRvL3ZrUFVyV2Q1YzZvQk1qNFJOZ1NhLytsZHVOQ201WTVqMUFX?=
 =?utf-8?B?MVlEOXdua09pRkJ2ZG5LdSs5NDNXRHFaRHJxc28valkycjFTTGJvakM2Vmlu?=
 =?utf-8?B?M0pEa1Z4Nmo5c1orYkhPeEI0UUFINEZGcHcySk9IR1Y2YUFEWjJNUVp3Q1Vh?=
 =?utf-8?B?RVE2M1VRRXllLzN1Ym5wYnZPSG5UTE8reWFqbWxyVmhvS3N2bHFrQUUzUHJo?=
 =?utf-8?B?SVBFVVBQQjBycVlxaEQ3L2Q2dUtsSHpoOUFsZ1hRdmlKYWRFeG0zS0NjRUlQ?=
 =?utf-8?B?cHFEVStWcktjMXNjVWN1MEJZeTY5MTJYVGZOdXZ5SFUzSVZkNE0rdkthZ202?=
 =?utf-8?B?T0tEWWZGWXE5SVEvUWpQKzZ3ODkvSmNJMExBbUppTW94c2RXVTJJZUNPZVkw?=
 =?utf-8?B?WG1ScWJ5UlR1UFFBRlpzUW1PSUhCdG5iZ2J6M1VRV25nL00xaDdQQTBsalkr?=
 =?utf-8?B?VlgyemdkYUlTT09XMTMySlRRS3VaeWROb1dBZVFsL1pzTStVMG9ZZEJnWWZN?=
 =?utf-8?B?ajBQdHU0UlF5TmN6dDU2YldTeFhHYlhLRmt1eWpEMTh4ZHZzTUFqclZiQ09H?=
 =?utf-8?B?NDRhV0VkQmZ3M0hjaXFpWWZVbk9YL29ENC92WFF6Q3Q0MWlxbmtTSGMrU0Fv?=
 =?utf-8?B?ZlQ2T3pJUmpVd2x1dzZaL3J0QnBSclVsS0pRSGpFY2dreVdXSHFLa25nTU42?=
 =?utf-8?B?cGN4YXNTY2FHSytqOHg0MEVCamJTUFRJRXoyR3pZcUZRNmVpNjdvM29ydlg3?=
 =?utf-8?B?THZQVkRiQ0Q4c1JERVBCekNDQXVCSWVCSTI1blVUdTVVaXNMS1YyOGVGVS9U?=
 =?utf-8?B?STNPVG41aDJqdHJOak9mNnhCdFRFQkR2V1pYbDZtWXc5N3RScDZSbFV5OVpZ?=
 =?utf-8?B?ZnVEMWFTb2pBRmxCaEdsckZ3N04zNS9KeWcxV29RZldTdG92WW9ZRlovcEZr?=
 =?utf-8?B?UVErOUwxL1lMUHJhZjdLc3FpaE54Q05BOWlEUWdSeVNPSktPczNOdkFITFdZ?=
 =?utf-8?B?VWd1T09mMWt3eHVGSHh3Y2NEZ1lpZ2Z4MHM3WHl0VkJFUHZWZk8wZzd3WERi?=
 =?utf-8?B?bk9XTnR3TkZ3VS9EY0tyWFpYUy9NbmZGbjdLdElITjZQQ2UrdUdleWJQSVV5?=
 =?utf-8?B?dSt5Yk9JeVN6Slc1NERhUEhjVkkvYnEyVmFpRzdVN2ZITGUvUHNmaUtEMlh4?=
 =?utf-8?B?OHZJMUkxblFqSVAwQ2wvUlBZWG5EZXhNYS9iYVlqMzFaaUNYYXJXdm9reURG?=
 =?utf-8?B?RzJDcStNN1FsaG1MaDdvbUROT2EyN0c0QjZMT1dhZVNCbmRWMjNIQVhGUElI?=
 =?utf-8?Q?jlFxtY?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S0lBdTdQNlpEaW5JWkQyQkw4bHh4bWtVdjhGa3QxT1BIeitKbi94aERneFFh?=
 =?utf-8?B?N1k1TFp3cXlhWXVyYTVuaENIVzFaZExiUVRPbTZCOGRwSUhqWFJTTll3czZP?=
 =?utf-8?B?ZTVGTmh1d2hXTkNxWUtGQkkxamJTU1I4Y1BKbGI1c0RYUys2YW1vSE1yOHlj?=
 =?utf-8?B?MW9jUWNySlBnMENjL29KTkZudWxYTWZYTldUd2JTYWx6SllRTTRhejhzMTQv?=
 =?utf-8?B?ZDRzVVpSdGJYYURsSWEvclZtcjZIR0NIUlR3bStaamFWMHY5OUc3eSttdU1V?=
 =?utf-8?B?TXJMSjVLeVRSaVJ1K3pZcWI0UU5UQnpOdzVydzlkaFZ1TmxadjhSdXpTM0xS?=
 =?utf-8?B?MCtycS9LRFFBbXhqYzFLbVl6ejFSUkU0SHVMcnR2N2dDOUoyU0hTc1gvRVFu?=
 =?utf-8?B?NTczUHJSOGJLSGNlWk91L1lHN1NJNE1sTjJPbmVaQ3dRR3lQblBDUTc1a2U0?=
 =?utf-8?B?R2YzNDNJcVZDUjFMblZhNlV1SHdURWp2SG5Jd1dkQ0wvK1lSYnlGOXR5RXg2?=
 =?utf-8?B?OXJodzQ3dUtTTUM2STU1NmtiWjg2VVpDSDNwckRrSkhMWk04L2lpSTd1WTFW?=
 =?utf-8?B?MXB2c1JKaGNIQXVGcW44U1B5RDNRSWZIN3I2YXJKY1VSUFJUaFZ5elJTczE4?=
 =?utf-8?B?WVVtUFNwYnRNNnlOUWZOcy92N1hDZWV6d3Q2Z0JESDhJb29CL2hkVEFqNUpI?=
 =?utf-8?B?eXdIQTBuLzBtaHRVRXJVbzdSVXdVQVVBclpDZmdGczBXa28zTjFJV00vWUNh?=
 =?utf-8?B?a1k3Q1Y4cWF6NUdIcGZZQ3puQUsvY1hwVFNwWmpaajVwRzFwNFpqVkF6K1pT?=
 =?utf-8?B?OTd5T0g4bHd3UXgwekxNQ2h5bk5RWStrM1UyMmZnZ3JRK3pabVU3M1k3a0Vq?=
 =?utf-8?B?S0ZJWmpMU3FBdmpGN1BKbFYwZlhCRXFBZXEzSVNnQTAxRHVVZDg3VVhvVUxL?=
 =?utf-8?B?Sm9xM2YvWWp4WEl2NVkrMkJBNXVoRHlnRHl1clM4QStNZFNxVHUxV1RLTm9R?=
 =?utf-8?B?a29hc1F4MDNvUFJaS3JTS2pDdzhTNE9CYUtCUzRqTmVScmxXQ2pPRWgyMUt1?=
 =?utf-8?B?UzB1WU9BOWVneHVqaEoxZjN4TUdBRHBZYXJJc0VaUnRtakhwVUNtVHZkWkVq?=
 =?utf-8?B?WkkzYm9HTFo3L25WUFdiZC9CQUZ1dkowaWFRWW40OHQ0Z1pKL0sxZDBWUTBo?=
 =?utf-8?B?YjFoSkxQa0NMM1U0SEdaSlRyN0xJb0NzaUZQd3J1NTNWYVdSSHBocitySlBC?=
 =?utf-8?B?OVpFOTlabU14L2F4N3BkTlJrREU1QU9FTmgxNisxNW1TNTkrejkzK0c2b1hH?=
 =?utf-8?B?eHNIQkFxTWV3MXFYWE1mZVIyNDFWMitNZUJQN0hveHB0bmp4c2lJOXc4WVVM?=
 =?utf-8?B?SVRMSUxUMkRocldpQjdyRVMrQUV1VjhaUEgxeHhOMStZMjYraVppOTdPQW1s?=
 =?utf-8?B?SjRrWmY2aDBBUUpWdjZuMGMrNUV0M0Z3OWVPZXZLTldWbVpjbHJ3T2FFOVJk?=
 =?utf-8?B?WGs0bkwrWDA5aEdrOG5yL2xKYjJkcUY2aEtLWEVYY215RG9uNkw4b0VCS3J0?=
 =?utf-8?B?SzFNekF0VFpOSkdIQnZIcWZMT0pTNHR2b2tIazd5cktkR1F6N25LM0VCY3kx?=
 =?utf-8?B?Ny9pVUN3UnlYNVVsbUxoaDRvNGdxVDJnc3ZGZm1qRjk4RHpSakNNNFVvVVR6?=
 =?utf-8?B?cUpVZ2k1WnpXZ0xCN0dGVXc2bW40RmRMMHhXNGRkNjUxNEdtcnQ4eUJaMkdM?=
 =?utf-8?B?Z3hUUlh5TzZzK3llWnRvUTVmWFJoTERJUHgxeG42WWR3ejhaQVFPUXo4c3RC?=
 =?utf-8?B?aThBSGsyUjdzRnpVZVFIQjNHN2ZOLzFXVU1CSGc0Z3YrZVB6SlBVa1g5bXJi?=
 =?utf-8?B?VTBnbStNbDdWZG1ncnFMdzZjdWt1aWVYdG91QVpVWWlzeUltbE1qU2FtR0tM?=
 =?utf-8?B?NVZlU0ZPMXVSclU3Wnd0bjluZWpNZjNhT0hPMHY4bXhRYWVrNmlWc0JYMkpS?=
 =?utf-8?B?VHE1NDNRaUI5THI3cGVzU2VtT0RMK1F1cFJrQ1AwQmpiNUZnd3prNjFKQzBt?=
 =?utf-8?B?NEJLTWtlN3VPTjg2Ym9hMlBiemEySmJDcjIwRm81U0Q2bEJCdDhSWis1dnBp?=
 =?utf-8?Q?t9Zaalo0egMhz5mXpvQ5pZ1P4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A80ED99E321B343BEBD26E5C951888B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b41a271-7025-489b-bbc8-08de3eb7ec81
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 04:34:40.0907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 QjY/UDlGWONyDSyJzOZsoIG/ZnBK8wnXQFGcQM2y2/HGsoZNcEz4Ybmqv7gLHORnFlTJJzzqBJ5meSjtCA8iXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561
Message-ID-Hash: 2VDFITSX4VBRPDUTGGUVEZU2RZJSN4PR
X-Message-ID-Hash: 2VDFITSX4VBRPDUTGGUVEZU2RZJSN4PR
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2VDFITSX4VBRPDUTGGUVEZU2RZJSN4PR/>
Archived-At: 
 <https://lore.freedesktop.org/50c97b2629dcb1456b936162d6cb4cbad8bfd937.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gRnJpLCAyMDI1LTEyLTE5IGF0IDEyOjQzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gDQo+IFllcywgdGhlIHBhdGNoIEkgc2VudCBpbiBteSBwcmV2aW91cyBtZXNzYWdlIHdh
cyBpbiByZXBsYWNlbWVudCBvZg0KPiB5b3Vycywgbm90IHRvIGJlIGFwcGxpZWQgb24gdG9wIC0g
SSBzaG91bGQgaGF2ZSBtZW50aW9uZWQgdGhhdC4NCg0KT2ssIEkgd2lsbCByZXBsYWNlIG15IHBh
dGNoIHdpdGggeW91cnMuDQoNCj4gPiBhbmQgd2l0aCB0aGUgcGFkZGluZyByZW1vdmVkLCBkb2Vz
bid0IHRoaXMNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgIGRtYV93cml0ZSEocm1hcmdzWzBd
LmlubmVyID0gZnc6OkdzcEFyZ3VtZW50c0NhY2hlZDo6bmV3KCZjbWRxKSk/Ow0KPiA+IA0KPiA+
IG5vdyBvbmx5IGNvcHkgdGhlIGFyZ3MgYW5kIGxlYXZlIHRoZSBwYWRkaW5nIGNvbXBsZXRlbHkg
dW5pbml0aWFsaXplZD/CoCBUaGF0J3Mgb2theSwgSQ0KPiA+IHRoaW5rLCBJIGp1c3QNCj4gPiB3
YW50IHRvIG1ha2Ugc3VyZSBJJ20gbm90IG1pc3NpbmcgYW55dGhpbmcuDQo+IA0KPiBTaW5jZSB3
ZSBjYWxsIGBhbGxvY19jb2hlcmVudGAgd2l0aCBgX19HRlBfWkVST2AsIGFsbCBtZW1vcnkgd2ls
bCBiZQ0KPiBpbml0aWFsaXplZCB0byB6ZXJvIGJlZm9yZSB0aGF0IGxpbmUgaXMgcnVuLiBJdCdz
IG5vdCAxMDAlIGlkZWFsIGJ1dA0KPiBkb2VzIHdvcmsuDQoNCk9rLCBJIGdldCBpdCBub3cuIFlv
dSBhbGxvY2F0ZSB0aGUgYmxvY2ssIGFuZCB0aGVuIGRtYV93cml0ZSEgbWVtY3B5cyB0aGUgR3Nw
QXJndW1lbnRzQ2FjaGVkDQp0aGF0J3Mgb24gdGhlIHN0YWNrIHRvIGl0Lg0KDQpXaGVuIHlvdSBz
YXkgaXQncyBub3QgaWRlYWwsIGlzIHRoYXQgYmVjYXVzZSBpdCBzdGlsbCBoYXMgdG8gZG8gYSBt
ZW1jcHkgZnJvbSB0aGUgc3RhY2sgdG8gdGhlDQpETUEgYnVmZmVyLCB3aGVyZWFzIE5vdXZlYXUg
d2FzIGFibGUgdG8gd3JpdGUgdG8gdGhlIGJ1ZmZlciBkaXJlY3RseT8NCg==
