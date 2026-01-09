Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A4D0C058
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 20:13:53 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 002DD10E935;
	Fri,  9 Jan 2026 19:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AAV5rBXM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6E1CA44C97;
	Fri,  9 Jan 2026 19:05:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767985526;
 b=jJ7BsPpCgoKGGOtksazehBt1HxlXCiQoG4wto/+xe5RjLL/uGU9/FoawT274cP2o/VA9+
 rHBDysC4MVWhKZAneAK4kIUgnkuD9uRmpxVeR7u4bmArc2mwo87Dpy2bRLXAKeeyCIkVS4H
 wXxmEXFdcaJsLk2YCT3558JABCgMAM9HnLsTYzQIrH55crTF1WnVayxnu6/WSV2IA5zSnQI
 YvbvPwJ6wVaz46XFto3tkuGUQYUqgVroAzd13t64Gigyt0kz7Uveukbs0laoIB7Hjq338ef
 2sSYcaVdq6bnNcJdb/Sc0bgTS7XxuhYHaYtNPHHzydE43iMFLeczSnlRCJNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767985526; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4G4f+bB/3PeOK+AJmUI6RsyiMsIpsP4RynoH0JsBANc=;
 b=SGaXP7Cl1fEdH51Y4bLh1FsVrquWAfBZNNf22uVoQCw9OGopIuTISF9/f3219y8z/FMH7
 GSzaouxoYafhzI/ui1Mo+KzJUpaZIGfsgQVczsQ+ZwnVRnszr9D2A8zZKR+bzPVteRnmh03
 IK4nwXIexVtqLOCoMQ2AsxB01pjTlFu6mTpZzR1Mzfbla87ZrFm0JCUdFSg8CBcU6fJMFFe
 na0Tc2Vr9Ls8cTmJicsIhUh4agpRb5jP2+RGJrCtt71chVgPJ+0O2tGYt9RCpefGECSP044
 qZIta2ZH8A37ka5aFyZsvRJ4b7Or/rEG4l7JrDa63v1RPS2yJjWmTcGvnf5Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E597244C4A
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 19:05:22 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010011.outbound.protection.outlook.com
 [40.93.198.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 20BDB10E932
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 19:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dij0f4HVt7Q41T1PfTWnIYt8rdJKa9Dz/ypSS0SCW0RZfRNaXWO+FVqvDOayCuhq9lrHRWYuQtbvjRw1ydd2+CqP0IsNHBDK2dOLBo3HuOttcIQeYxV9MHLfmHGHcGaJ2yD0qpNIvrBduF3FwR2bUvAZ8ax/GbzJWFbB3lqvnOjGX20b2Mc1o7lqYsmtrQK+ERSKZqc6B80H5y7oVae1AB3Zmm1BtY1y69aJA1flcJ505Ja9N4RzsnA/BI041Q+e83bHAWy3/XLGXQr+RR6wYkq64MRLuflXUbyr/0OWJq6KiH526gbHXi75/N3holNZM7LjJWs/HEXuh6JT7L9Uhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G4f+bB/3PeOK+AJmUI6RsyiMsIpsP4RynoH0JsBANc=;
 b=nVQRTiv/o4OgFTiZIAAXpyGn910DFelZOa6Nj2ayopG650fUi1kBL9GMiJRcxUB9Yc6zfyVu/ybt2i9FW8aPBhgWh9uzy9o/q+aTjmfDKmPuAEsE8dTByn7URDg+LfT0isXly4JHQQtl9fp6aTG4Rzk3t7YLxNmOpL1RGAOI0b7zIKVfIvzqtpZuJZvEmLJwH6r/47ui/jofoq8KqXVq5GOA2SnEsP4A21hN6yoeFWhz0MTDEqAp147vIQ+U8ubfKrYVo5cUe9IHAmTSpNQTtDJSJyrzts9fTKMrXrjdPlVIyWSRX7sobWvGPuB1nXdZRbGIZ30s/t2I9cUdaNQBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G4f+bB/3PeOK+AJmUI6RsyiMsIpsP4RynoH0JsBANc=;
 b=AAV5rBXM994X5JxMvyBuFPdKuo2dXcAptY87dzcyAdRPOCNww/5Z3Dx+Vmi/3458QGPHlAJ5/QqBe3b7d36b200SthXqBUsTJkvwymP7B7nyX6Uon2m4CvKPrWetXqU/4MnY0OFjabbH6PebpFU+f2iLPSixryPwt7xqZQOxQpRvfV+y6V38mOLIJmhB6rX5FwHMeA2mrg0FLkWbjUw4mz/RA1aIxzRowms+N2fvNU2l8HZb6gRk8QMBAC9jMCzAB/cJS63lP7KeghVeFECsZZPfM/B2xYF3WP/HMEzZuBVAZ7J3zvEag3+vkJz+QQtiwGwgELJrUI9MZBIU/PqnNA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 19:13:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 19:13:40 +0000
Message-ID: <4a11be38-e752-407d-98d5-658086107d1e@nvidia.com>
Date: Fri, 9 Jan 2026 11:13:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: John Hubbard <jhubbard@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-10-ttabi@nvidia.com>
 <bf3bd88f-ba73-422f-b2e6-24512dd19ff3@nvidia.com>
 <d20159524cc52ceb266dc78faaae0d2e9ce15c2e.camel@nvidia.com>
 <84b40c4d-ef8c-4b7e-b8f8-055e57516a55@nvidia.com>
Content-Language: en-US
In-Reply-To: <84b40c4d-ef8c-4b7e-b8f8-055e57516a55@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a0fc85-9fdb-42dd-0c27-08de4fb3326e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nm94cDU4QzFZVTJ0WDU3NitnSDlwZkVvTFFCbWErbVN6MXg1RHdTUVBURENv?=
 =?utf-8?B?dW00alc0eFdsRkFPUkE5dU0xSlBhMWY0ZEJsMTJwM05UMllKMnRLMHlORlJD?=
 =?utf-8?B?Y1c2Yko5UkVoNmxscnZYR1Eva1A2TWRod3p5RnJmK2NJMDJRWUp5aTc4LzAw?=
 =?utf-8?B?eTVCK3llUm9vbTFLeWp6aW5XbEM5Nyt0Tkd3aXZpdGs2VlQrQVJ6RkoyN0NC?=
 =?utf-8?B?UWlOTXJJY3YrenBXY25nZU50S0hJRkRiOWpaZ1UxeVNoTXYzVlJTYTJCOGY3?=
 =?utf-8?B?SFRJN3Y3ZFcrQ3YycFVnNjlIK1ZmdGVEZllUVGdlb1g2eGVwN0RwRnM1YWhG?=
 =?utf-8?B?eEY2MmpQQ1kzSkZsYW5sMVY5bFZCRmZXNDFvTGRvQmE0S1YybGt4V3FJOGls?=
 =?utf-8?B?OXRhRUV2YksxaU55elQ2WVorSHZKWTNHcnpCWlBoTWEzejdNSWkzdU42ZXdZ?=
 =?utf-8?B?cU0rT3pLNjQwNzQxWkRWTnk1SDYvR29pWk5GZzFwVUd2SjE1YjhLQlJQZEJO?=
 =?utf-8?B?ZFhvcFpmcGxYakxaQnpkUUcvbW5aeE9HMnJmQ1h6MWVuSWpmT3NFanNURkYw?=
 =?utf-8?B?V1FKRmcrR1Zod3pyMmtCcFd1cEJVZGVDWkZSUXVkS25teGpINEhtcFlqcmdJ?=
 =?utf-8?B?K2JiWlVmbUZSWjdxN2tGRG83YkJxcEZsNitncHBiZDNHSDFmR21SbWV3U0l3?=
 =?utf-8?B?OERRNTdwME40azNkR3lheVhSTlBVVHkwUGNyMVNRaUNTV3JhdmdHa0w1UGZ1?=
 =?utf-8?B?OWhGRGRtYXhNWmN2azl6c1R5ZWNlTzdFZ1g1UzlLV00yNGxBaG83eFlxbTRS?=
 =?utf-8?B?ODNGeTVibzk2cSt4MnBjUlpPTXUrUEI1WVZ3ZHlYVlR1MmJtdXNIbW1oTVJM?=
 =?utf-8?B?WnRqYk5oRHdzNE05RnM1NzhrcnhrT0Q4VzBhamRlQXVlUFY0emhaMEREY2Vj?=
 =?utf-8?B?NFFOK0hxSXh4OXBuR0R2YmpoaUcyeENaUHgwQ3QydzRRUmp6em01M1lTUExs?=
 =?utf-8?B?UkVoRTBnRDIxWUswbEdIQ09TWndiUGJmNTJ3eXVhR2R4LzF6bTJ4NWt4QVRU?=
 =?utf-8?B?QWNFRC9vMEFmMGQrd3U2WGdoZmk2QXVMRkx4Vm43Yk1GdW1xZ1BTRFNVTlpr?=
 =?utf-8?B?S0VGdWgwZlFiRHEzVG9qUVBkOTZaMzFXUUJqbFN5S1poMENYVmlJdXJ2OUZY?=
 =?utf-8?B?cXNUT0syWi9ObHBmR2RrY3NYVkNUd3RDTngxMWMwKzFjVXBHTXBCeWFieGdp?=
 =?utf-8?B?L3lvKzR5YTgyaS8vejZLSnFqWXQvQ1U4MTlZeWlmMmM4QXVpU0c1VDh2WVdW?=
 =?utf-8?B?eE5ZL3cxMWF4V0U3TTRzb3VobEkrWnlpTmlycFYzRHZRdnlvcTJXUlZiTURQ?=
 =?utf-8?B?VEw1RGN3aHZEZ21uOWlBL3ZzTTBHL2NhaUlkK3Q5S1RTUXBOZFNVQW9zY2tm?=
 =?utf-8?B?UVVPSE16MC9JWGpYR0p3dHBWOEpKck5PT2s2VU9OV3FSU1RnSmVIV05Zakxn?=
 =?utf-8?B?ZDZwbTJqNkkwRjdlVld4UFRibm9SOUNtQ3pkdmE3WTdiM3dCRTBsRmlTeHZh?=
 =?utf-8?B?YU1DWFZ3Qkh5ZTZOTVlZeXFjZWgzbGZGbnBSektzYy90ZnlXWU1jMS9qZUd3?=
 =?utf-8?B?cDFLeVkyTXNiMGtwNVdpcHhCZUQ5QXVFT3BTcmVUclE1WDdRQmczcElsMGZI?=
 =?utf-8?B?bTRzNTZxRVFjb0NCVjRuRE5lS0VVUVljVkVkak50cUZCRkhhWkxuNHY4NDlX?=
 =?utf-8?B?SzQydVNFTnZ5S1V2MXFBNU5mNTRXMWlMY0ZjeE5VbENmODZHVGl2STJYa2RO?=
 =?utf-8?B?ZmZacE5JQ2ZvdVhFYzAxQ1pYVzFlYngrbSt2MGRod2JaSUorR2k3NVJyYXVl?=
 =?utf-8?B?UXFQNTNpNVlFWUxCZTdxdWJOOUF5RE93YXp6dzVyelYrQTdvYnBraTRvb1FD?=
 =?utf-8?Q?2kNOQW9SGHPt/z6UArAfPA4Su54logqg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2N2OHFBeHE0MXA2WkJqSFFNOXVvOWxyMmwreHY2c292MGgwRlFoeUxVbTQ3?=
 =?utf-8?B?UE1sbnp6UW43NTNORmJLeW1SbGI3bmk0cTUzd1lJNlF1VHM4c1loZFcrME53?=
 =?utf-8?B?ZjArbWNXWXhXLy9QSWpVVGlkTzY5TFZabkpjSlBoZlR1K2lndm4zdCsrc3cr?=
 =?utf-8?B?dXNPK1R4ck9BL21UckdHU1NZd2JBSlE1TEppT096QmNWcEtQcE5uUGg3ZXgz?=
 =?utf-8?B?REVaczJlT29oMGdZbGNKeGVYWU05bUJ3cndGVzkvRkRkTXV0Y2QwR3ozUkhS?=
 =?utf-8?B?Rmc1b0NpT2tTM1RSYjNWSmptREQ0NHBvN1Q3WC92U2hiVFFzcUFyY3Z6dUhR?=
 =?utf-8?B?bDBpd0F2MVFZckdMajNSQmlzSzVsMnhYMzhsOW03enIyR2N3WHJFSFJnYTVT?=
 =?utf-8?B?QXFmODVHUVlhTGRRUWN3OGFJRWI4amtmNHFPdzBEY24vSlVCQXMxTXljc2xK?=
 =?utf-8?B?TUJhOEthZjJUaDNrdDBZT3RmVWNKRXYxMnp3YU01TE5aeHMyVzNCTWNQdHJm?=
 =?utf-8?B?Q3JGQmtIcnRIUlhFRUFDQk5BQ1lwT1lMaTMvaVVnaFNsNXVEYlVtU0NCZ0Fi?=
 =?utf-8?B?a0t3SkZ6aUhMNUo3VkxoQnYyT05YamtjVDZIamJaMDlrQ2NIR3pPbENtU0sz?=
 =?utf-8?B?blRnTkl4RVh5ZzdMR2gxNUdzTEk2TnR6bWZ4UXZtREt5V3pSQlB2WjFyUnJy?=
 =?utf-8?B?K25rWEFpNEJCdmVieENtNHp6dStadld0dXRrSGgwNUdJTklrb29SZHpqRGxs?=
 =?utf-8?B?S0w2Qm1oaGFSTFRKd0xQVk5OQnhhTGlwUXFET2NWVkVMMjdUWTBld0g3c0Vq?=
 =?utf-8?B?NUFsTngvMVBFWURkbFN0aThjanZiYlhwcWZrQnFrMUk2S2xjTUpjckp5SXc4?=
 =?utf-8?B?bWhPY1hhTXdhcFYyemZBMnJmN3hSOGxacW9nMFZOVWJCc0poVU53TUN1cVdY?=
 =?utf-8?B?bWtXa3ZFamUrcnIzem1EL0N6em10OUMxdnRzOThLTEJDeGc3ckc0dnhXWDJa?=
 =?utf-8?B?UWo4djN6andmYkNYQ0M0eWp0VmhYc1BKY2dSYnNNNWV0c2VGOFdTTXZHUXpZ?=
 =?utf-8?B?Q0lzUUJCVko5RGl5UE96Qmk0cDVnbkNuS29taDhWYUNsT2JvZldwMTJpdkFz?=
 =?utf-8?B?L243ZXFMdzlxT2crTXpMRnk5TENPRGlxSW15QTcxdUdRTEo5MlYzYWNjSHRn?=
 =?utf-8?B?SlRBMDgvMlc4c0VwT2dYaEJKMk9INkIyYkhVSVZlQTJiYlY5cFRuSjRRUnFN?=
 =?utf-8?B?aitXZzJKdG1jL3M5QzM3VjdwaTVMc0JHcWtJN2Y5QU9vZW9MbzJodXZuMTlz?=
 =?utf-8?B?c0dXV3MxYTRUNFZVdjdqeTNiZ2daY2k2WTJoSE1Fak1wd1k4YkVvVU5xV2tV?=
 =?utf-8?B?bDVURDhXNEtmbC9CT1M2b0JYbjZHbHREeStHM1hXQWxHZkZZRkczVjVxNEtL?=
 =?utf-8?B?bVZKTnVUaVBQdmFBTmY4U081NnVqSkRIeUNGSkYwT2hoWWE2RDMxNTAySDFB?=
 =?utf-8?B?Rm1Tazc1K1VCajBLZ3JZZFZ6eFppcFZoMWpkVmNwT1hoNkxlY2FBS3plb29r?=
 =?utf-8?B?aDE2WCtuUHYyUGx1WEF5Q3hpVGw3TDhSUTBmZDNPcVhmaVBGazBvRVJ5aUxY?=
 =?utf-8?B?eWdYVmNNdlJmOXJHSGVSbndyY2dhbjJXRGpoVFRSdDhrZ0xyUXZ3b3FOZ2hD?=
 =?utf-8?B?cU9RbjNHU0VTaFdsTmY5UllPNEcybVE4STY4dnNBWWljY0NVTEhEUmJOS0tt?=
 =?utf-8?B?ejVlQ2g4SllXOVlIV1d2Tk9BVG5nMlg3dkJ6a2JHYnpNMHgwNzBXNW1BMXdP?=
 =?utf-8?B?SW4vcW94eUlsaHpMWXp4ZkpNaTZmbWFKT3dvck1LcTV3MmMzVXZIZUsxdTB1?=
 =?utf-8?B?STlXcHZFSUdYdTVYcGNqSjQxU3hOeUQwUjVPWGdzRTZiamFFWXY0NjNyUmJm?=
 =?utf-8?B?M1J0SzRBK2prLzhDTkVnZE1URjlITk1lOXRXVlN3Y2J5S1ZjZ2tmVThVVGlW?=
 =?utf-8?B?dlRMZTlVemQ5T0Z3VVFNN2o1MGtaeCs3KytYemtRdlZ5UUlmVU54eGtVWjc1?=
 =?utf-8?B?LzJva1lRbDhsTExMVnNTZ3ZvZTErUUdkdmZ4SXhhYzROU2c4dmwrNzdwcU9O?=
 =?utf-8?B?YXcyQWxtS3gvWkN2Szc2b0tBUDNRd28zTGZUWEJ2ZmdXQ3M5QXcwUEJpSWd6?=
 =?utf-8?B?bFd4eVRpR1UvYU92NldkMjJOam9hMXdKOFhkN2NSYjlLcTRNMFRNcmJVR1hx?=
 =?utf-8?B?blVpV1Q4Qk96ZGRzSFpUaituZVB5MjJpSWJhUEZZQXBVbHd0VnZ4RXQxQ2tC?=
 =?utf-8?B?cnZBOVY0T1FWZWRXUGFvdkh5ajV2ZjlpdXA1L1A1Vkg1WGhZYklHTW0xbkti?=
 =?utf-8?Q?tMZIdLJrgv+dgY8Y=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0a0fc85-9fdb-42dd-0c27-08de4fb3326e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:13:39.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OA/NNUf1OtEjSJLcBJh+/bEfJ3OV1osXLbMd0ig+FRCsEN9BxV0PIYGg6TUJ+zUbqkwJiiAknI6rSF0tICl9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331
Message-ID-Hash: CA6GOIWYTZ4AH73HUMGUPANED3NNWVFN
X-Message-ID-Hash: CA6GOIWYTZ4AH73HUMGUPANED3NNWVFN
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CA6GOIWYTZ4AH73HUMGUPANED3NNWVFN/>
Archived-At: 
 <https://lore.freedesktop.org/4a11be38-e752-407d-98d5-658086107d1e@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/9/26 10:59 AM, John Hubbard wrote:
> On 1/9/26 10:11 AM, Timur Tabi wrote:
>> On Thu, 2026-01-08 at 18:53 -0800, John Hubbard wrote:
>>> It may have its own imperfections, but this is *approximately* what I'd
>>> prefer (below). I believe that it strikes the right balance between
>>> simplicity and Rust idiomatic code--and it's not any larger than what
>>> you started with.
>>>
>>> And it won't cost you any time to implement, since this already works:
>>
>> Do you realize that this is almost identical to my V1 of this patchset?  We've come full circle.
>>
> 
> I hope I didn't review that one in detail. This is really pretty funny. :)
> 

But more seriously, we are all still calibrating ourselves about how
far to go with various Rust abstractions, in various situations. Here,
"we" means all of us involved in writing and reviewing the various
Nova patchsets.

And we have different levels of experience with Rust, kernel, and
GPU drivers. *And* that's changing as we continue to work together.

So I do expect this sort of situation to start converging over time.
Meanwhile I want to apologize for you getting jerked around on
reviews. It really will improve, I'm confident of that.

thanks,
-- 
John Hubbard

