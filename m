Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA437FC96
	for <lists+nouveau@lfdr.de>; Thu, 13 May 2021 19:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6966ED98;
	Thu, 13 May 2021 17:36:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7176ED98
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 17:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4fvKmDlLncknHBKMTWjQvVoiEhe/TOg8W8Gt5soL9Ly9Nq4RRlr/zZ/5moz6tBAQp4z95tUXl+QQvYB3i6lSKVDum0A2zF/nmFw4/q2PCR7eLHSEqEGCQvcHT659769phJV+6oOfRCNrUV33apz7Pngu2FD8T9Kd/uD477k2NhthnJ9qOt1Ik5shFOvxwxRkljscQV4LF93L+NuM7asiypXEYmL0XXqlUtKpnxflttmnb7HTy2HS1xsqUog3bip288FHk3g53teVHfrRBIOVqNkIp0LCdaZ2O0+QpPmS5fGtIYHVXwJpAswPFxnf7kMmBKvztACTftQgvFoXWDoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga+YR/cMj9x1Q0EpsICdw5iMy85Owke4nkk/eysm1+o=;
 b=m2BrYS2UxfZ4oMa0l/lQH+K4f7sYDA+1uNNRKq73hmi5eW/ZhQz43UF4ayejPBafk6OxuhSjaTRCsKDCxRXN0IRpmTfSE1b028jcMSUSq+mG6JF7B/lLSuX3bTt/RSlTZ/r7Y0JCo6XuJdv2/dz8Vt/bRkNDjjcwRjRG+eNGFkGWxEdezMRJeqxm0eyywWdBQBJKdvFRmuNEhvTinlm0gdeMm6hVYaa9mFmVz2jyOFShbDZc2GtDwUjoILgkS01V45TZ5oTx+jKmeK1MN2Izpv+UW7YvdphVqkVmvwfxQ40X39SX4fwAg7tYGqDscGfB0fJJx1VmsbxB9eXBenl14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga+YR/cMj9x1Q0EpsICdw5iMy85Owke4nkk/eysm1+o=;
 b=K4aPX0+vPeJYST7HNYws/AIWME0p3zePtIHT7YCf8DPO1F9n2hFJGbp0JS+2vIAQTiCwpcEfe9/ZGnmXwMLoAW+1/q3KCt1IeAezSf3+hdYicX0H6R8gQHiGfwhpXLAgzJq+XW5dACvfOcF65Gb9SiJw1Rf8EGdRqhBW4wRsWTpYHzcFxbyTj6Nv+HTZYfOI0aJTB5G17OSeGSBHJSts9w36zdS6l9WAvtghPk5oBXf5tk54aWZzqvdyfPMCIoXiO/nZsxKitgFJTh1xCJvwgpHig8FnMwy/3IDWuUmyp8mX1fPzukcrgBcRStGSwplQcU2i+DZMVzaJsAsSpqS08g==
Received: from BN9PR03CA0903.namprd03.prod.outlook.com (2603:10b6:408:107::8)
 by BY5PR12MB3906.namprd12.prod.outlook.com (2603:10b6:a03:1a9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Thu, 13 May
 2021 17:36:21 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::2b) by BN9PR03CA0903.outlook.office365.com
 (2603:10b6:408:107::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 13 May 2021 17:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 13 May 2021 17:36:20 +0000
Received: from rcampbell-test.nvidia.com (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 17:35:39 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
 <YJ0mVAK7OjwIGnMe@casper.infradead.org>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <750b6107-71c5-d17f-60b5-b4e8edb3aa99@nvidia.com>
Date: Thu, 13 May 2021 10:35:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YJ0mVAK7OjwIGnMe@casper.infradead.org>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f6e84d-2006-4a72-a7fa-08d916359f1f
X-MS-TrafficTypeDiagnostic: BY5PR12MB3906:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39065A3771119ED23C652555C2519@BY5PR12MB3906.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L53qcJ1otNCJ++C8SASIh3rh85neljMZmdfwHpyucWvjMLSb/QXlpFYEQEMjoTUVuFf8vVETyLpEna/WxcQMbRepBr8+rNK3F13zOAywb8o1xTLDUAOjQa3x4HxWCP+yj1w7OVcZbQTRIQCzrJuYARsbdkomW88F3qsbstasFuJhKfLt1thhw6vSloJAGJrj265iX8x8zsx9MBGzz6PdLKHJXS0Syx1c0y/bqHPf9M7Y3sfHfrXz8tpdkzT4VhLez6z3OJ2rNYUI81NPZDA7BN4SDwBGv9lzFzvNd/cqpLASGWtWvIkLNwtcgJfC37Whwl1b42qfRFYHb7b/t3Glqd446UKe+zkiCXItvCKgG5n+Udj8x6Utgu75ed/3fETKxcv+XkU8Pp+/5IEcldSpOzUdEAsnhUlCsggiEVUD/T2Hz7hKJJFPEKbZUyqGpv04D8XJuA4D1WSzMjxj2eGd7gRCIlW0gaW/snQpN+5ILNwLIfneBF9UrtARTaE2TDkETq9LgDawmbUciFzYq2btvHnuoB4BnPncHAx1QUlzZCmtVG7aq+ul67rykVKX/jBTzvgFGEr/D7meff9Zix7ZGl8CWKnkFrlx8LMbXlVQ35rIPSm9NRMXwuqElfn+aUW+07jXP/P0xXQlr3LqtvJlMETR1P+2Moltc7TRKXihWPiXP0lakyBXWCNGZXKaP2i6
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39850400004)(46966006)(36840700001)(26005)(82740400003)(53546011)(8936002)(6916009)(336012)(2906002)(426003)(478600001)(186003)(7416002)(2616005)(86362001)(16526019)(4326008)(7696005)(70586007)(316002)(5660300002)(36906005)(31686004)(54906003)(31696002)(36756003)(356005)(83380400001)(82310400003)(36860700001)(47076005)(7636003)(8676002)(70206006)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 17:36:20.6586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f6e84d-2006-4a72-a7fa-08d916359f1f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3906
Subject: Re: [Nouveau] [RFC PATCH v3 0/2] mm: remove extra ZONE_DEVICE
 struct page refcount
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 5/13/21 6:15 AM, Matthew Wilcox wrote:
> On Thu, Oct 01, 2020 at 11:17:13AM -0700, Ralph Campbell wrote:
>> This is still an RFC because after looking at the pmem/dax code some
>> more, I realized that the ZONE_DEVICE struct pages are being inserted
>> into the process' page tables with vmf_insert_mixed() and a zero
>> refcount on the ZONE_DEVICE struct page. This is sort of OK because
>> insert_pfn() increments the reference count on the pgmap which is what
>> prevents memunmap_pages() from freeing the struct pages and it doesn't
>> check for a non-zero struct page reference count.
>> But, any calls to get_page() will hit the VM_BUG_ON_PAGE() that
>> checks for a reference count == 0.
> 
> This seems to have gone quiet.  What needs to happen to resurrect this?
> 
The main thing I need is time. I have been tied up with other commitments,
there has been a lot of changes going on in FS/DAX and the page cache,
and FS/DAX doesn't use the page reference count to indicate the page is
"free" but rather that it is "idle" so I need a lot of time to really
understand why FS/DAX isn't just any FS on top of a DAX block device.

I too wish this was easier to fix.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
