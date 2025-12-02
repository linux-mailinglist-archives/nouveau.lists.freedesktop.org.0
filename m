Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF78C9D117
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 22:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13BF10E6D6;
	Tue,  2 Dec 2025 21:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="stM/0rMd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011054.outbound.protection.outlook.com
 [40.93.194.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E50410E6D3
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 21:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysTIdOCwy5qTlQdxB8pfMSMoIz+Fkswif2w93LKjMMln5awiLkGpPPyb+QE+NbVsx6zLXuVmEMv5SSczwWNt8zQcDevWN+KA2ktW/74pHyE0VZJAGyfimHlUodvTvwxaCygiVcr7e+nmb6ATZrjH6iwnSc5N2T6KVTUyW3McR8bdhTwL/xOoo0By+yuYS1q53fLQoPCeJ7ZqTi5xBfGT4pJl8b4r99pgpl+x6zuR3BtjnC2o30d43C2a/SoRlzBhZ7KRbHw6lkeds4x6Mqg/LPEFfuTaTwTUS95z59bXNM0VNbNjDWatof3sH4DOeahViAGjQg1Ji2gYFoj10bpLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN0CnYUkUxs1SdpaUctUJb+T+NqiXxwRhOZaaZJMnYs=;
 b=CWjH9RzxjbtBbq7lTFUczw4DzJNdCJIOjsQDWvddJmYYYXbfms/cCyjKpHIhxvzkBxoUFhY9+/wW4/60NPwelEhydJemnZvnLq55Rr6po9/6FRSXyvN0eLNt+i/Ig2XMUoU0sHFF1PvuL5mOPMWTfnW5TOeThM9m376cGuNSFYennwWjgB49sb+3UV9ceAGiNIQDQfmqtWLQTYfZgvRajU8jN3O/xXqyNW38RExO2ywURObhKp7XoVIwZa69SA9uFMzha14JSbxoTWQKCSphpSkJioTvEa65765TzVULnZSCtM4awDtWC9CA4Ac3wwLy8BjG4SCSenMhNUOCMj6SGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN0CnYUkUxs1SdpaUctUJb+T+NqiXxwRhOZaaZJMnYs=;
 b=stM/0rMdo99lcF3bstVed0pk3arU3H1Zc1ZxAWirq+RoCJHmgGQZFj1QGndegISLSwQUk2SKCiVCLsU7IsszuPdfg9QV+rB8mkgaZQ8ZTi+/6+JtlVOT3UsiWXFaRvJi1gl6JGLEjM7lADSk+jOx2n61BDNrxpWMZGAQer6D5hLYF1FTOuw+H2ToPLrt1imOX7JgSi06bCH5UiyVqTYDPFrxQ1MEcrggHnV1tdPjp0pcS3Wl3U/a719xHDJUSna87BvYe5zVMNExxsxkxksnWIheW7EnPHjvgtLr8tbxn1/DGbAnpEscfnxWmJ4LHzI2f5nR9Fa1uv0F/CanED7tsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:23:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:23:13 +0000
Message-ID: <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
Date: Tue, 2 Dec 2025 16:23:12 -0500
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
X-ClientProxiedBy: BL0PR1501CA0014.namprd15.prod.outlook.com
 (2603:10b6:207:17::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 31640494-68c1-4510-f0e9-08de31e90059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzNQYXZwY2dKcDk2YTZaSW9ZTFN2cFQ3OWIzbGlQd0hoNnlYTThaM0xIcXNK?=
 =?utf-8?B?Rk0wMjB5YkN1UjNaNVFGOUNFL3FBL0dVdWkvQ1hRa24yL0g1c3IwZ3J1Wkkr?=
 =?utf-8?B?dmdiZ0lsdWVRMEtrSkNscTNQNzhjVlhvZVNmL3BuSkdicmg0bnQ2OHRxbk4x?=
 =?utf-8?B?cnAySVdlVWRTQlFJc3pVSnIrMHhqUjNBVE9CQnFRZmZiVDljS0M3VnRrZ1lL?=
 =?utf-8?B?UWpNUUphWlBlbkE1c0djelluZGp6SDhOZkU5clI4YUxpMHh2ZUE5ZG8zUEVi?=
 =?utf-8?B?bVZ2a055YUZNdUhWOTFwLzk0Nm92TE1Wa2FjSVBEVzdNa0NkN0doUlRSN3lW?=
 =?utf-8?B?cTVOdGZSVXVvVktUcWpRT21CVTR3cVVXUVBWNDJtWUlFQkt2LzJUekdhMXVQ?=
 =?utf-8?B?UzFLcUlhSXIrOGNPMlNwUElkZ2ZRSGloTVdJa0NnMkk1NGVmSlYzTHc2TVpQ?=
 =?utf-8?B?ODZxQnNHY0VQWEp2aHRjLy9kL2xmQnc0TVZESC9VaW9lMnR1K0U1OFFabnlq?=
 =?utf-8?B?NFFGNUttSnJrV1d0Y2tHZzh2WUlqZ2huSU1IU3NoQzdMUVlmTzRGTVIzZGlV?=
 =?utf-8?B?bi91TW9jK3dCNzA4VWVSZnhGY1A2NTJGK2Myd3BZTVB5c1M2ZmhId0wwd3FR?=
 =?utf-8?B?UHFoN2F0ZUYyVHdIcmViM2t4VC80aUZIZmNoSWtLMm5IOUpwZWRveDBJQ2xv?=
 =?utf-8?B?eDZhU242Wk8wU2FqVzNKYmhNQkkzanI2QVpoMzhNblFnUTNjMjJTVWtWQktH?=
 =?utf-8?B?OHVDZHF4ZGtQbUFhMXd3VjRabWtINkZ1aVlkMWdLQWhpNlZKaTVDMlBlMElE?=
 =?utf-8?B?bEszZUU1cHZmdngveDV5T1YyYll6U2RoWEtVaDBRNXhjUkYzbmJNWWwrSE9C?=
 =?utf-8?B?VnBkMXU0TkFwS0hqS1BmalVaRVZadmZTZkFOUzMySk1BS05oVFBYNmcwN0gx?=
 =?utf-8?B?TmtWSk94bzRCNzUybHg4Si9JcEhYMkpmZkJpS3l2L2g4dWcrdmFOemVHSGFF?=
 =?utf-8?B?dE51MUh2cVpabHgrK1RKeVd0Qmp2WkxXM0FQWlhZV1VBZ3JrT0pKdE5TOGF5?=
 =?utf-8?B?ZWt0N1U4anc2S1lwcWIvOWhySlhUNXNYY2NRdkYwWDZaQ3Q2MHhRLzJ3SDhK?=
 =?utf-8?B?dXpZWUdiV0ZyZEhpc2IydXZkbkYyQjdDS2o3VmFnVFppTURRTjhYVE9CUGgr?=
 =?utf-8?B?T2krd1VBTnFURGJ1OEJnUlRFdDJsVmdacmEzVEhqUmtvTkZoVjNuSEJPV1Fl?=
 =?utf-8?B?b2xrOUp1ZDk4Qnowc1lPL3JEbUVqNmNXNUE1VmdMZ2R5TkswYk1CVTd2NW9O?=
 =?utf-8?B?OWVLL2FCZ1JFV2RPNnhiQ081ckQ3SVowZkIrRWJ6OGIvSUJidUVIcElidVRr?=
 =?utf-8?B?OFIzVzhlNngvNmoySmUxc3MybVBFSkxCd3NVK0VOdm8vWUVoc1pMODdhc1Na?=
 =?utf-8?B?ZnZFcXJuZmErc2V3eFVyb1NzQklwVjZuZElQU2gwai9ra2Yrb0Q3c1pyNUxn?=
 =?utf-8?B?VkFWYStuZkl0a2tQZWx5RjMyaVFtVmFvVC9zdlFtenBFNDZQcFl1Z1VFazNx?=
 =?utf-8?B?azR3WHlIS3Q0S05VRm5ha0hGbzY0MGhNMk4zQzB5OTJqTnlQUUpXK3ZVV0Zi?=
 =?utf-8?B?WnFwOW1DaWlELzdkN1MrbENRc0pDM1A1dmR0SmlFM2luM0dsQXQzOWpQOGl2?=
 =?utf-8?B?VWlrY3hNMi9tSCtGWUhib1pUU2M0L2VMa3RiL2ZFc0kzWG1XdGVmcGRySXJk?=
 =?utf-8?B?b2s0Z2orN0xSSnAzMTdvS3JQTzFjVjByV0F4UkR2OVI2TEY0ZjU4VnNZcnlp?=
 =?utf-8?B?TTBRY0I1MHd4RVhSSkEwM3I1UXdxcFEvaEJmbnZzZXdNMVdDaW5WWkNBMmR6?=
 =?utf-8?B?VldnaTdTS3ZCd2p5SzNzT1VxMDlzbEhzVkx1RzJlWVNsNDlQVXJ5NDJMaWtr?=
 =?utf-8?Q?v31LZ9FM8SGwzUIpXYG4XeC7rspPd38d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3A3SlI0aG1DRVJqSFhHbW1UZEMvd0hTeDg1SnczZ0cza1Y2U2h6N0FIcExj?=
 =?utf-8?B?QkszT3VlTURDeUsxVWh1QjVuRW50aldoanZVeDNJM1cwYTJWangrOFFzb2lo?=
 =?utf-8?B?OGptWlBGTWlUUVdjbjBmWmdwclNDQ2dROVhqVU9NRVNPODJrUFY3WlZlSUs4?=
 =?utf-8?B?RXhydWFDSmlDQ2pxNzAzc0cxc0tyQ1JEbkFPV3lCd3F6UXRLeFVKZithOUZt?=
 =?utf-8?B?VFQyVEFLdWQwT050VnVEOS9hcnQ2SGpQNmNHTk56YVZUbmVIN3ltUlZCdVl1?=
 =?utf-8?B?RWsydDlMSlVoSk5HSmZYbTQzOEg2cmIybzJ0MTF3ZFNGZjZucGQzY2hCcHNR?=
 =?utf-8?B?Z3RicHMrUzh5YzAxMndTWE83UVQ1dERTQ3NaYkhjbmFPOHgvTkNhRHFQVVpR?=
 =?utf-8?B?ajhUYmQrSmNudGgzWGE2K2hmbnpKNVlESDZld0drMG5wbVN6WFlITU5oWmRY?=
 =?utf-8?B?ay84dEtIekJoNXhsQzJRSUZzdndxb2dRY1c2ZnFQUndic3ZYejdscG9ERGov?=
 =?utf-8?B?U0FnT1BtNzdMVXRXMFdDemxmQk5SY1g1NjNYWTN6by9CNkJrUmR3OENIc0Rq?=
 =?utf-8?B?QlZDeVhvNUUvYkJFKzlWRlpwWEZ2YW1vdCtyOTlrMWhQbG8zRHdQMElVUWl5?=
 =?utf-8?B?MDB1RTFaVEFEM1lEd2lWTHNjZHQ1OU1hMjhURHVsaWgvNmRUSEc3SzVvR05s?=
 =?utf-8?B?ZEZ3eUJFcFFDWi9Bb01sT1lDS21BbWtSTTFhbWQxaGxCVHozdWl3cE1hRXFK?=
 =?utf-8?B?b2t0OUo3R0NkUTl5amQ2ZitjUEd3TXp3aG41bk1vNVErUzF4cWNwQWtpRmJ2?=
 =?utf-8?B?bDVVa1VEeFYyRmIzb292Z2hTajBaRjhyQ3p5NWFxQitXSHdKMmdMTWo4MUVX?=
 =?utf-8?B?SFVWWlBiWlRxOU1qV0Izd2tCbXZVWGdQd2pxOXBmbU1leENrZ0h5NDJHRkdW?=
 =?utf-8?B?MHdmL0dXam1JQ3NwRDhFUTcvbHVkWmh6SUV4bkl2UVVzT3QxVEswOTNVK3g4?=
 =?utf-8?B?aUNyZE5CQW45bEg0TjlwWm1OV1lkbHI4ZHM1TmFSTTVOMVBOQXdmUDZ1dWd0?=
 =?utf-8?B?WjZhNnpYMnF6a3JtZ0Q2bDFSVUVnVVRSVlJ6MlBtUWQ3SUc0M2J3K1haanVz?=
 =?utf-8?B?UVFQOHp1TjF3RmwrRUJmb1drc0cyVUszeWhEYUdsL1hXR2E1RTdDODFCbkdR?=
 =?utf-8?B?UGQ0ZnVJb21DSHhQYXhFb0xHdmhObTVGdGxoa1Uxbm1LMlpXMVBoMUNQTklS?=
 =?utf-8?B?MFIzejZWMHN1WG03SWVkMTNvL0k5dE9CYlR6NXBrSmsza3M1bytOY3BSNGhN?=
 =?utf-8?B?bDhKbit1REtacVBOVDVUaGtIb3NvZ1kzVmVhaXFIUFliRFNvcUl4UlRGbVNh?=
 =?utf-8?B?YTFWUU5heEhFOFBuY2pzYzhGRkhtQklmd3BDNGw4MlBpaGNGd2l6S1puNUFY?=
 =?utf-8?B?NVVjblR3RTZ4aUtVdVFHVGNtdGV0WklLU3NnalI5N0dibzIvcHFVYXYxQ3g2?=
 =?utf-8?B?eU43MWpybGJHTXlmbjgyMHNhSHZxZDh1bS9JR2M1VXhDSkJNbVpxbjB6RGR2?=
 =?utf-8?B?RHJ3ZHNiOXd4alUzcTZyM3VHVHR2TU9Tbm1zK1E0Si9xbTJvYjlPcjVRZFl3?=
 =?utf-8?B?L2pxbzZIWTY2bDlEVmZwZkt5SisxWmJ4KzJjUGZ4SGxvSjYwbXRqcFc5V2Z1?=
 =?utf-8?B?ZnVXYTZ5bThWQlM0VEVjVEVERDBHOEUyaTVsaWZnTFI1dncrb3JObDZDY0Z2?=
 =?utf-8?B?cHU1NmpBYWk1THA0bnBnRXVMVThTMnVDekhxOGJIWUYvSzRPem1FR0dNUlV2?=
 =?utf-8?B?c0srUmVVL01NdDdwUkVMSW5aMEljNTdVSnREdVlGelZqZ2pZUzFucFQyMDZl?=
 =?utf-8?B?c3BmTWlqaGV3eS9UWC9FWGtwYlBGTDRRTjhOM3V3NWU0QVI0UDZCN05zWkhV?=
 =?utf-8?B?M0NEMDZOeWtEZVRybVpjeElLbFN2OGN5cWlYMVB6WEpYY1NtbGJuY0FMV2I0?=
 =?utf-8?B?VXJnM05qaW9tcCtidzhxWjNOV1h2V1lLbnNtOFB5MUpnM29LUHRzdnVJWVVB?=
 =?utf-8?B?enhWT2xLcHBWR2pFc0NYWkxqVnV0R20wUnJvM2N1dDNTMExkVTJiYVBuUFpB?=
 =?utf-8?Q?+GYP1T/xRo7WPtV0OkGvVLlKf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31640494-68c1-4510-f0e9-08de31e90059
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:23:13.7385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9I9Xa7ZVEoykisMm+aBxMS4gxvP0wwedKCS+BK3Ubiuj/1+gb17zEex7nXq0T0zYx2Ruz1uN4wpwW7R9n9r+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
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
>  
> +
> +    /// See nvkm_falcon_pio_wr - takes a byte array instead of a FalconFirmware
> +    fn pio_wr_bytes(
> +        &self,
> +        bar: &Bar0,
> +        img: &[u8],
> +        mem_base: u16,
> +        target_mem: FalconMem,
> +        port: u8,
> +        tag: u16
> +    ) {
> +        let port = usize::from(port);
> +
> +        match target_mem {
> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
> +                regs::NV_PFALCON_FALCON_IMEMC::default()
> +                    .set_secure(target_mem == FalconMem::ImemSecure)
> +                    .set_aincw(true)
> +                    .set_offs(mem_base)
> +                    .write(bar, &E::ID, port);
> +
> +                let mut tag = tag;
> +                for block in img.chunks(256) {
> +                    regs::NV_PFALCON_FALCON_IMEMT::default()
> +                        .set_tag(tag)
> +                        .write(bar, &E::ID, port);
> +                    for word in block.chunks(4) {
> +                        let w = u32::from_le_bytes(word.try_into().unwrap());

If img.size is not a multiple of 4 bytes, this can panic right?

Even if it is unlikely, unwrap() is quite frowned up due to possibility of
panic. I'd recommend something like the following since the function cannot
return an error:

                        let w = if let Ok(bytes) = word.try_into() {
                            u32::from_le_bytes(bytes)
                        } else {
			    // can print a warning here too if needed.
                            let mut buf = [0u8; 4];
                            buf[..word.len()].copy_from_slice(word);
                            u32::from_le_bytes(buf)
                        };

Btw, I wish we could encode the slice length constraint in the slice type itself
(i.e., the slice length ought to be a certain multiple). But I think there's no
way to do that without introducing a new type.

Thanks.





