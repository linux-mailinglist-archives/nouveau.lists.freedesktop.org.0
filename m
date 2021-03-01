Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9C328319
	for <lists+nouveau@lfdr.de>; Mon,  1 Mar 2021 17:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783146E834;
	Mon,  1 Mar 2021 16:09:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565D96E826
 for <nouveau@lists.freedesktop.org>; Mon,  1 Mar 2021 16:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4ymwUj9BRb0GZA1Z3oGF9/tSMBbAXsYaETVQxDsTh1XYfc/7f9ZaXVeeIfBCNmYLBMfSfvoEmaNf2X1cyqsNhZLzBDLv/HnoArOdn4RroKbYfQyMjWYvWEmUER2x5zAvVz402mwmlCjIddpAodnGasXXINTeB2wA5SAExl9YwMrgY5uXoQKTgv0J3O0Zx1M3CcZSr4aywlVlGCYqBBG737NLM/KCBFQcE5uxHyLpKvHqOJW9ylRA4XKA0lxhCgMPs1z186LZiKrQjFvfFsxho7G5YBRHvlpH4azETdNQOduhXR18FOa39p52cuOqx7Y5W7zPqBWCt9rJVb8d8/QJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=c4EXy/D65GnWZGbTEzWHueQBBU4dz/8+h/zxfUNE4YP5IHYT5Bhwj1wtRdJz2NN+AV1c2AfCUJmZH8UiuOKtnM52xG0zbz9Rq3XbJylb1XIFFGoDnW/VIwR6JlCr8+j+KZtJxVEC+XyXjybfeu+/PcXXGTYEuIeezfoE1RyZFpfM8VexGAelFbsi8INwZsdkeeQ8YFkdTu6VkItPPgzrjTHa9CdETmG6gOR5LhnpZgFlz6YnQVpfIPtT1znJHG1CS22mOfJvoruI7Er8IlHyyd1vTeYKbwt4gvOSxNLpDKNeibvZNsyunnVvPqR4Vvr+Draa4IgVRyfEqKbeCQPvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=WSdqGqOZKC8kxtob3x0SYKr8ia7MiIwuPy5g0e2MC6UQuSVxTBVNeoPzqcvfv75S/6aRTilVWgS/OzWvCg/qOtB1rBSn33SAYP0+R25Vmp8boPqhgimVVjTMYrHuLPiynw8fTFADcs+f/cxkaRrI9J66Cry6RT1qpFJZe5aTxXQ=
Authentication-Results: x.org; dkim=none (message not signed)
 header.d=none;x.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB0205.namprd12.prod.outlook.com (2603:10b6:301:4e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 1 Mar
 2021 16:09:05 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%3]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 16:09:05 +0000
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <cbaf7050-1d0b-5f47-f34a-b19f81e1345d@amd.com>
Date: Mon, 1 Mar 2021 11:08:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.25 via Frontend
 Transport; Mon, 1 Mar 2021 16:09:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41651866-9cf5-4d10-4d55-08d8dccc5633
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0205:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0205E83CC1177F5CD94CA5AC8C9A9@MWHPR1201MB0205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NdU67eLOmgOZPkF6SswPQsPht4klDFhkDtz0cmtVEn1r9Q/Fv5ktcJvN+cFKOwolpZVR7n1oRJ/gFW5uSeJX9w7oJVf/8gTN8nWb2N22+Jx8Gz5ZyZVo6TBPuY6FJrN8kRdHi4Xk+bT+mJQg9nmYa5tcDoq26eD//hwRK4Ov8B5wmzZK6y6gskxrpl44637Fvn5RDJhQGiIgrD/hyyUAkLg19OrND1kq3atVoazuGWnT81ymkmXJLy4fTxx4Y1cbVO3p7VPPe7A5DsTV24SR9JFSyqJbFqoAB/rsqwTPkcRozb+e/2BG0AxTjkAXIWrknwP8D6moHUwU1zAgYDkN+0LmpynI861ZdeS93Vhi+tg1m9Ayb8IyU560BRw+MJaTRVbXRg0VPvUvLsa6K6K8Xwtd+f8fa16sL4/Sk5DawwnLoWKQzPGNYsGKYn8ijbOmu7mvZFlVMDlAquuck3IeDpIdd5r2tQzkWPssOPKgfKefZmpi8KN51Ymdnk7BD9q7LDsM9FryCOEiQBA+LBO9ZlPEAgZBb2xeDDNJUnRnwsEfa6bBRQMiNdvMFlbgy1opJzN91B5ydyj43H8w862ncslnjrF9mWpGtsYLwsloN4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(31696002)(44832011)(8936002)(2616005)(66946007)(186003)(478600001)(26005)(8676002)(66476007)(36756003)(86362001)(956004)(16526019)(4744005)(6666004)(316002)(16576012)(52116002)(66556008)(5660300002)(6486002)(2906002)(31686004)(6916009)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0pWSFhuNjlHWm05T2RmY210R2FHSTBwYVZ2NE9zV01kd3B5Z255L1ZuaFNB?=
 =?utf-8?B?VTlRcERZZXo1UHBjQmF2aWN2ekF2UG9HeWZHcGJ2NHY4TTk5enVTdk81RVcr?=
 =?utf-8?B?YnpiQ0hhSTB2bm01UkF1U091bG5jOUVPSDZscEJ4a1pjOFlzd2VYTDZ2REor?=
 =?utf-8?B?K1k3ejNJb095VVFScmtTbS9EZkRqNStZRm9hMUV3U0pIaVpqS1JrUlNOMnVk?=
 =?utf-8?B?R0lDOWFCS0JlVHlCalJOWGNlMC9ac0tQUlBVTzg1bzdYU1FvUlI4R2Z3S2hw?=
 =?utf-8?B?aWdFaXVDcnhEVTF4T0lzV1RhTEJ1ZlZWa2NjVlJ4YW9ENDloV3lKOUM0bnU3?=
 =?utf-8?B?SFAzZFZNaDVmUUdrRk00dCszUThqTk1BNndQRWhRNC9YSCt0QmZpM1VLUW4z?=
 =?utf-8?B?ZnJ0QS9ocGNrWFJGMmtYTm9rL3FWY1IzbER5MGpZK3VCOWlCOWJKSjlMUTN1?=
 =?utf-8?B?QzRKcU5VRjdtNlVSdU5sMHBJaXpuTHN0eTlCdjhCcFF4VlV0aVdhcXByd2lH?=
 =?utf-8?B?NWJGQ1hyZlBTOWJEOENwMHRJVVpJVy9qL0FUQnZ5OHJSc1Z0WmQxU29zZE9D?=
 =?utf-8?B?Q29pM3ppWldocjhYbTgwRkM3VEUxL1Fvc3B1S0N3QjNUK0g1Tlp2d1huZWhJ?=
 =?utf-8?B?amVpU0tiS29PbHFvczYxMHVnRTRMTGpRbHp0TlNJNjNzSGxBSEVNaEhxZzZ3?=
 =?utf-8?B?ZHp3LzF0UDZkNHVIck1NWGkvR1JBeEJIU0pPdlIrSmJiUEJaY3lQaDV1MitG?=
 =?utf-8?B?Zm1TMXZwMW85aUlSMTQxVWRRTG5lOUFrRlNyUWd1bUlrOXBFUXBGbVZ1MjRj?=
 =?utf-8?B?a292UkRxMEJXbllOaDcrQVMxSHVzTmxhaHNQVnFrdTIrYlQyV0lIVVhiVHoz?=
 =?utf-8?B?eHRmL1JaR3BKNG9penVFUi9hTHBndUg5aUc0TmpQYnc5SkJ6M1RubTcvWCsz?=
 =?utf-8?B?aUdYekpER2lOaHZJaGZpT0JBSUI1L3UxMGlIZ1hpYzVPMUJ2WEtTQTY1Z242?=
 =?utf-8?B?S3o1Tm1lMVkyeExWZWMvQVM4TXZhN0wrdWJNQ0wwTExjOEFGUkFCYkJFcEM4?=
 =?utf-8?B?Nkx2SG9Sd3c1NHZTdTQwRXRMc1dUcDh5R01wcThyWFQ5NEROc2d4UXRoM0ZX?=
 =?utf-8?B?TVBVKzBSVTdHSkRuRlB3cit5TG9QbTVPVnB6RnBtdHhabm51bVlrekR4Yk9K?=
 =?utf-8?B?dU9qcEdWbncvRmhEK2VzTGV4bFhTZ2tpczVGdGtVWkE4eFZHTjJ5QmdBc0xU?=
 =?utf-8?B?RlFlNVIzT0wyT3VNbHIzcVQ3cHVNTWJrVklLT3V1cXRWUkRJNE1YelgrdTZ0?=
 =?utf-8?B?VFp6d0tkQUFWeEhMZldHK0NHTGZWT3VVNmZSSCtVa2Nxd3A1T3RvVWxTNWZp?=
 =?utf-8?B?WVgyN3k2Q09WQVJHWS9NaE5EUlFzdytDbzBGZXJBa0hKWDJpdHoxK1lQQmdW?=
 =?utf-8?B?Sm5IMHFycU9US1RxRGFlVS9pUytHWCtrcXVsT0dzN1MvRG9RSjBLRmkwSnc4?=
 =?utf-8?B?RWo4ZFQrUnBKZkw0bTgxa3RRZlNmcWtmWXFiUU1CLzdWMklobjlCRmFkeTN0?=
 =?utf-8?B?bE44UzVQc1FHSmFHUUx6RTVUMW5IaGkyb1FQY0c3bEZiNkxnQk14UmN5YTZE?=
 =?utf-8?B?cWJPY3BwdElkdlptMGRDcE54OXJKcXFqdDNSWU0weWZZblUxWEQyL0VpTG5n?=
 =?utf-8?B?ZTBIMUlKV1BoN29xeCtHZlZSMTBQRnBUd3FBV3pYUmY3cFl6MERBdGpaS3ht?=
 =?utf-8?Q?Y+keX3qK+ZA3cSJ84+A77QzjT4utk01kWUut/KC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41651866-9cf5-4d10-4d55-08d8dccc5633
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 16:09:05.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7DSqmnD5hp9Li6VBdUVcivy0aldnsJOFFc/du9CqaREuBd9KR3viei/KgW5LC8lNUVBUggGvGUFgP/xck/3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0205
Subject: [Nouveau] 2021 X.Org Board of Directions Nomination period ends
 next Sunday
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
Cc: elections <elections@x.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Unfortunately my previous email seems to not have been received by many 
people. I will send this email separately to each mailing list to 
hopefully get better coverage.

The nomination period is currently ongoing. So far we have received 3 
nominations and will need at least 4 to fill the vacant spots on the 
board. We hope you will consider putting your nomination forward.

To nominate yourself or someone else please send the nomination, along 
with a personal statement to elections at x dot org.

** Election Schedule **

Nomination period Start: Mon 22nd February
Nomination period End: Sun 7th March
Deadline of X.Org membership application or renewal: Thu 11th March
Publication of Candidates & start of Candidate QA: Mon 15th March
Election Planned Start: Mon 22nd March anywhere on earth
Election Planned End: Sun 4th April anywhere on earth

** Election Committee **

* Eric Anholt
* Mark Filion
* Keith Packard
* Harry Wentland

Cheers,
Harry Wentland,
on behalf of the X.Org elections committee
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
