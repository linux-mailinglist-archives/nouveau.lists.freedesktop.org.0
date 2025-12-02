Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E56C9D164
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 22:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88DE10E6D9;
	Tue,  2 Dec 2025 21:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LmZ/7Y5H";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011029.outbound.protection.outlook.com
 [40.93.194.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7D910E6D9
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 21:28:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goIGypCWLnREP/OeIoPF9FwihWF8PJDpHchkGKFGJeW2MmT5YpRzIZfftIQaQSyl6q1AdjkbRfuZ/Gj4tU+I6EQ1BmZD4FGQscc1CP2EuYUsbS+PMG3zlx7+6ecW0dgumAvxTYX4GYEH9hMalsH1RuDFLgv18ruHElp2xlDgtbihKrp3YP0GcZlL4sVQxx6oLh6QsbxkEW1cIUvbeAed3YEAUkxggIhwe7Py+sWYKWtQ+aY2LDOxVViNcdqDe+PZv5fW9hgbBGqsFo8Qs9xGo6puq9JcAi1HBbt5xyhAPs9LLeB/fburBpUBuwHlMnbwsQ50jRHtckIjSTrm9JP4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlpXzjYR498q+xfrIcsS4fMX8ABIiy/kzZUeFYlzgX0=;
 b=UOQw4Ap02non+RvJonao/GylvkULnSl4f5BWfP8n+VkU51jJ0322zdNPkjOJNanmqKuotVHH8IEReJ62dbAWGFZzcRwLUnU4zATmzLGUGh1zn9u4EC3+L2A548fufqKCEVnJU+qcoCGElgGNUSQw/r+F5RKkNfuhBIJhoSKKUZTVW5pZxifcT+x1aCe7Jjzgdil/QXmZt0PN49DCqB0RQanwY9MsGjxmP9sHgQKzMI8SdxJXzx9l13hCbprP6o1cwp6sFAMXrcXxwsy6IjxIfLtvGtpetGSOvaNBsinZ62aF1glfB/qdjmYF5IITXeMaA+2RLj1awKNVRi7kisjmhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlpXzjYR498q+xfrIcsS4fMX8ABIiy/kzZUeFYlzgX0=;
 b=LmZ/7Y5HNEGuQtYsE8WniwuSaDPA9QbIEvCB8vc6PoLTj1sDX7nwN8iLCF/a3SPHxydIfp6mgxrQPMLSgApnGSYyRdWeNLUHWEDGLBOns6n+n3Mc3M5vCfPUshDtG2SEv1PM6uZYibjuQ2b6LdNxPjp5iqiyqEGXybHGgzj1pFcx0QxNrlFQJWunJiholkVluB9nRw8V/ZyqzSdQFR/SyuEpTqbOjpg5EOKaKcWCXn9SwN3i4nhZ9lGozyxgjzgypThD7HwJLlzv+K/sJPbOMbihPDo8XIDThP0HK7gmUlGTfUGHEwC/faEE/9Qs1rp4JWQK+tWplCkde2nmZKK8VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 21:28:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:28:13 +0000
Message-ID: <f4cff3d1-b6bc-47bc-a0d7-7be17d79de8b@nvidia.com>
Date: Tue, 2 Dec 2025 16:28:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251201233922.27218-13-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0027.namprd15.prod.outlook.com
 (2603:10b6:207:17::40) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8c2cbe-2190-4c49-15f1-08de31e9b2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U29jSVJDVjZvMnRJZVJZOFV2OGZoeHVrbHlIaDh0TUpYcXdadlhjR0tzenYw?=
 =?utf-8?B?UThYYmR1emhhK0VPMnhFQkg1Qmh0aC9VRVpkaVRGeGRZSFBHSGIyUXI5VjJV?=
 =?utf-8?B?M2dqTGVPaldxNnhFd2E2TVBtb3N6MmVHU2NQbnVNRTdIemw5Y3VOeWdyMXZN?=
 =?utf-8?B?cUY1bEdVRmNsN0tzcDZhYzdOK0M1bndxRnN6RmQ2Qm1ucXo0T2FaRTdwU2k5?=
 =?utf-8?B?UXN6a21nemQ5bDg2Z3NmSzJ6cEk5Z3pGWW81eXpjZWd5MkpHZU9NOVBpZE90?=
 =?utf-8?B?V0dtcmRCSmh1YUVxS1JETW1VWlVNUGVrVjNuMGhBTm1JSWFhNlFvQ25KczdI?=
 =?utf-8?B?VDBaMkYvQ3RuZjVlT3BmdEU2UGxIeTl4eWh2R0Y2MTBQUHMvU3JQQkJ3OExU?=
 =?utf-8?B?am5tU0QwNllIZC9SR3E0OXZsWFp4dVhBWkJzNFdRMno2TmJ5YkhzUDNldkF1?=
 =?utf-8?B?c044aUhOYUtVS2pHbit6WmRSd3dDZGlIS2tUSDRtK1U5WHp4ek9xY0liNGQz?=
 =?utf-8?B?VUFRQjRaV3dodDMvWHY4UjVHaDJqNkhYTGRtYmFhT0F1U1hRd0FsWGRqTmxD?=
 =?utf-8?B?UWZrdW5CV3ZKaWFuTDJjWlpHM1NJU2FQMm4veVNUaEpRdThRUHNEQ3luNG5y?=
 =?utf-8?B?dGFzanVwam9SU3BtS3dsUS96RmR1ckc0cHVlaUZUaEZFcW1ObDA0RHorQ01Q?=
 =?utf-8?B?eUdDMU0yQnJKUEhKUVU2QU1uUU1qeG9hTGZyQ1hLNlhFcmNYUjdkbUpvV0hp?=
 =?utf-8?B?RGdhTlB5cktjNmpqNTR6YnpGcmEvZGhYV0ZpYzh0dmVVRTh1cHZKTUI2VnFr?=
 =?utf-8?B?SE5lWnZRKzRFdGJXRWx5RGlQZGsrU213Y1RZNU9qaHM2dUgzRHlZcEhqR3R1?=
 =?utf-8?B?RGR3V1VWY0hFOE00Tiswc0tVL3VRaTBvZU9xVkRISlRzVG9mZUc1aERLSXVn?=
 =?utf-8?B?dGlSc2NxWmhycVhHWHVjRVdBaStmNFltOFhMdHRROG9lZzFmMUZDNWdWRlYz?=
 =?utf-8?B?UXpYVURqeW5kR01JblNyYUU1enY3MDVNTDQrV3pvZ2dvZDdzdDZlMTVOSlFC?=
 =?utf-8?B?QzZ0NWFXQTcrMXI5OEszZks3NjBoRWhnU3AzUFdBS2lJQ1NXem5ER2d1eGlj?=
 =?utf-8?B?TlREWmdxZkxmMDdWN1VuUmtGY0dmbVNTdHJQQmtsenkzQlFzOFBYdHUxd09w?=
 =?utf-8?B?c1BPZ3VUVmhzN0FjVjRqRWdNWGVqYXlLelh1YVRXenFVNE5JeER2dTJaUC96?=
 =?utf-8?B?M2NyakRNbTNxRHJFcUp1SUFiQWZsWEJuWjI1OS9FRk1HR0Mza0Q1UmFDaHhD?=
 =?utf-8?B?cGNDWFh1UlA4L0FaRkYySlI0eWVOakw5dllOT09BRWMvd1dRN0x3TU5xWmN0?=
 =?utf-8?B?Vzh1U2NORVhUYk5qVnBEMGtpRFdsNDduVE5PdDJLeVF1eFZ1MlgrYnlFbjcx?=
 =?utf-8?B?aUZFVUh3UUFBNGVxNUoxcU53bUN6bUlPSmowWlkvTkRXakJSZGlLbHlSZ1cx?=
 =?utf-8?B?d2dTSndsK1BxUDd1c3JjYkRqQXFqOFZCL3hqSVBWNTFZKzVZcWJzemRFcnZm?=
 =?utf-8?B?WDhSOGtqa1pZUFBSd1p5UVBxb2F5cnk0ODluSkdiNGxXQitLaVJLMmZBY3Yr?=
 =?utf-8?B?aXkvdzBsTElGZXdzZkVpeXVWNlBlYllHMkszbWFZOE1GSDRJTElUSm5XUXpx?=
 =?utf-8?B?dnA1Z1hFOTJxS1dla0lzcWdEMzRpVFFHOGQ2enFWWEhVZnVQN1JoV0MvbEZB?=
 =?utf-8?B?eG9SUTVKVnlFUlZVS00xT0pFdjJKWWg0K2c4Z0IvME5JRjBqblFsanFZTmQ1?=
 =?utf-8?B?cGRvNTNPYStNVTZqUFFRSnV5WUdtMUp5bHA2TUtoSlJzQ1ZhT1lnUXQ1T2VW?=
 =?utf-8?B?U28xSG1WS0FJMmQ3NHRHS1U4QVMvVlNpWHVCL1hSL1F2eVpMb3FmWkQvQVVU?=
 =?utf-8?Q?94ap6UDh7yT8+BDiY0zlGu9+wA5aFpQG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkxsTitWVlRmSzF0cXRKTG9GUDRqWXNtSGc1c005SGVRc25yb0hkZExRZ3FY?=
 =?utf-8?B?Wk9wOUhNbzZsUldBWFpEb0VvK0tIT2VoZzg2UStZYTQ4YTVKZ3FsQnBjNmtS?=
 =?utf-8?B?U0REenBtMnB6Zy9PTndveldtdWFocmRHdXYrTHFENEhFTWROZVlHS2NqYnI1?=
 =?utf-8?B?cTJjOGZQaGFQME5wQkVvNS9GRjg2Q3JtZkR2TS9NK2JwTTJaSTJKUFJTdzM4?=
 =?utf-8?B?MlVlM1NZdTJuUWh3dStTVk5YaitlbSszUGVFb1NhU3JqeEdEbFRTaHFxd3JL?=
 =?utf-8?B?bGtlbHVwSjRFb09rZFNhMmwxYVpXVzBDYms2WGJkSnJoL0M5a3lSVjFRWTdu?=
 =?utf-8?B?N0FnNGozamh0QnhCWHJTMGNNRmtRS3NVd3VzMWtiUzJldElrdFJMSThqckNG?=
 =?utf-8?B?eTdPYWJsT0VzZUhFZnEzTVRnaThlNWQ3MTIxSTljNWVlRHk1MFZxajdnaDBX?=
 =?utf-8?B?Q1R0STdRaXhIT0NTTlFTaUU1MXkvMjFWK2pVQXVFQkpQV2lsOU9PY2hNSWFn?=
 =?utf-8?B?TmoyWk8zVU1Ea0M4SG5ob1JaSkt6L1BGRUpwK1M0OFQzOVdwVzdRUldWKzF3?=
 =?utf-8?B?azFaSU9EMWw3Y1FsczN1RDZDQWFEa3Y2M1oxUFlPWDlCM0hWa1NJSnM5V1Vs?=
 =?utf-8?B?ZzBWKzk2SlVzb1JVMHdZZmJrUUQyZmdodm0xNHFrNkhyNTRNeDlYOTRBRlZ3?=
 =?utf-8?B?Q3hHRUVWVSt0cE5xVXlJYy8zQUhRcE1YamhyUmNHeHVMNW5QTUhjbU1NdTU4?=
 =?utf-8?B?N0pVM0RxZzZLTm5sb1RBamRQSkhTUVhxM2YvY1UvRlh4WDBNOGZBS0hJaEo4?=
 =?utf-8?B?UlBKL0tabTRYK3ZkbmZTNkRRK0lmOEN2cWpiVllIaVdMZVhhS3hCS3ZwOGxF?=
 =?utf-8?B?dlAwWXBoODNVR21IeTZqRytVclNocGhYRWJReFpYOFhBS1NjTmxWK1d0UUN2?=
 =?utf-8?B?Q1JwTDZvK01lMG5mM04yVVJ4L0V4aExuZk1OUlo4aHo0N0VhMnptcUVUdWh6?=
 =?utf-8?B?UTZLUVdUN0lWT2hDMzhIWG9kc1lGUjNpbXJlY2NPNTJvVnlRTnNMeTcxYk9r?=
 =?utf-8?B?U1RoZlF1eVgzMWZhZkp3U3JRN2J3dW5RRSsvNjdLc3BlbkVnSTlJMFk1MlZK?=
 =?utf-8?B?eldBTy9tSFBvb2JOUXd5Y2prYlNJOC9CWjFZNEhQSGxjVkkrQUV4VUEwQzRr?=
 =?utf-8?B?NjVFZUxGSVBiQ3d6OU1aY05sVEVJZFJEZFRLUThjMHp4M0I3dWNpRTk1NnlY?=
 =?utf-8?B?T1NEMHcxS0wxRWZMOW5EWnJJLzhEK2hZdEFlNjdZekpZQ1lJTXhYODRXYXpT?=
 =?utf-8?B?Nlk0ajJzSFZnakYxcWNIKzFyb21URFJYVXl4ODFmTUJwdThuQmVVVVhGcEJJ?=
 =?utf-8?B?N0ZDQUtoS2RQN0UyL2s4UjhMNi9PZGhTeC8xd1lJcXpxeXNRM3ZsSG4vK3JZ?=
 =?utf-8?B?dk5VQndxWmhHQnZqcEdVaWp0YjJKRnpvcWgxRGZZUDZzTHhkd3hyM1AxUzc5?=
 =?utf-8?B?UVIwZUJQdTN4Mk9XcHVEY2dhck1DMDRCWHNzM0tvRStYNlBxZDcyajBBOFJh?=
 =?utf-8?B?SlM5RzBNYXluZXphMzRBMkJSbkZIVWV4djFFT21JZ3FPeU5pREVZdmtNU3pF?=
 =?utf-8?B?ZzgwQ29xZU51cERSaFpGZmNYcC9PWmpLcUpiLzRvNHM3dXlCeElzNkJFenRF?=
 =?utf-8?B?dGlCdTYvTTJFbTZxQTRPNUdraTNSMytXckFYZ0Iwckkwdmh2NER4UUZaL3NR?=
 =?utf-8?B?YlRjSGx1WUM3UEh0WFYrMUdpcVJhcVpxL3Y1V3lpVmF0TWVUSG1PYkwzTE5N?=
 =?utf-8?B?TkNLUGt1bkNpWVQzKzZ2Z1F2QXkrcjQ4WVl5YnlWOVJ0MkRqc3ZERkpKWTdr?=
 =?utf-8?B?dWdKK0ZOSkNIMEhLSldSaU0zNm1iZVRpZTRUZW1XTS94cm84bTNsSmZOYUUz?=
 =?utf-8?B?YUVoWGp3NW5FWm1Qa2NhWjlzTE5yREtCVjFXUCsvZzF4dm1pUUNNL21GWTNJ?=
 =?utf-8?B?TWNVTmlaaEdsNnJraUhvclVrYTI0eVl5akpVc3RUcFlXdEF3b1RMTzU4Qlgy?=
 =?utf-8?B?b1p1WE15R2VxZThHdG1naW1VKzFmejcrd2VzRmxSR3JUUFJsVkhlamo1VXhi?=
 =?utf-8?Q?D9KvK2+qhEW1EBNZ1h8t2G74U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c2cbe-2190-4c49-15f1-08de31e9b2dc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:28:13.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Orv/OMU/oB/Eej2Arf8ByKkefMMdfBtBgFpbvBGldlJufEoshpscwoq5ZMGryJKPX31StSkqPKWemZgCyAF9xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285
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



On 12/1/2025 6:39 PM, Timur Tabi wrote:
> +
> +    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
> +    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(
> +        &self,
> +        bar: &Bar0,
> +        fw: &F,
> +        gbl: Option<&GenericBootloader>
> +    ) -> Result {
> +        let imem_sec = fw.imem_sec_load_params();
> +        let imem_ns = fw.imem_ns_load_params().unwrap();

Same unwrap() is here too.

Thanks.
