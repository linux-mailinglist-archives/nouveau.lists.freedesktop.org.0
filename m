Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3621895F
	for <lists+nouveau@lfdr.de>; Wed,  8 Jul 2020 15:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22916E113;
	Wed,  8 Jul 2020 13:42:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1463 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jul 2020 13:42:43 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE2F6E113
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jul 2020 13:42:42 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068D2RCA106547; Wed, 8 Jul 2020 09:18:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325dxe9ryn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 09:18:16 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 068D34YN107846;
 Wed, 8 Jul 2020 09:18:15 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325dxe9rvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 09:18:14 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 068DHqDE031516;
 Wed, 8 Jul 2020 13:18:10 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3251w8gbx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 13:18:09 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068DI7C955836784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 13:18:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFF504204C;
 Wed,  8 Jul 2020 13:18:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F63642042;
 Wed,  8 Jul 2020 13:18:05 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.75.251])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Jul 2020 13:18:05 +0000 (GMT)
Date: Wed, 8 Jul 2020 18:48:03 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200708131803.GB7902@in.ibm.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706222347.32290-1-rcampbell@nvidia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_11:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 cotscore=-2147483648 mlxscore=0
 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080091
Subject: Re: [Nouveau] [PATCH 0/5] mm/migrate: avoid device private
 invalidations
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
Reply-To: bharata@linux.ibm.com
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jul 06, 2020 at 03:23:42PM -0700, Ralph Campbell wrote:
> The goal for this series is to avoid device private memory TLB
> invalidations when migrating a range of addresses from system
> memory to device private memory and some of those pages have already
> been migrated. The approach taken is to introduce a new mmu notifier
> invalidation event type and use that in the device driver to skip
> invalidation callbacks from migrate_vma_setup(). The device driver is
> also then expected to handle device MMU invalidations as part of the
> migrate_vma_setup(), migrate_vma_pages(), migrate_vma_finalize() process.
> Note that this is opt-in. A device driver can simply invalidate its MMU
> in the mmu notifier callback and not handle MMU invalidations in the
> migration sequence.

In the kvmppc secure guest usecase,

1. We ensure that we don't issue migrate_vma() calls for pages that have
already been migrated to the device side (which is actually secure memory
for us that is managed by Ultravisor firmware)

2. The page table mappings on the device side (secure memory) are managed
transparent to the kernel by the Ultravisor firmware.

Hence I assume that no specific action would be required by the kvmppc
usecase due to this patchset. In fact, we never registered for this
mmu notifier events.

Regards,
Bharata.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
