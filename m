Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C319D12B2C5
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52906E064;
	Fri, 27 Dec 2019 08:13:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7CE6F98F
 for <nouveau@lists.freedesktop.org>; Fri,  8 Nov 2019 13:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573220620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2GiDgurLDTLnKDD84ZeRHZfEMXgwhDnYu1U65URo2k=;
 b=X5L1L1Dvt2VD4wgLd2ThvFRorrC8z5//fvXQ9/D1v1E/2zDmfPkj32me7SDxMbtG0L4sQn
 CWXx1Nib6/EE+M5vWD+6/6K4N0sYzAxoqKyEz2zyI467tQ0pjwgXzk4nv99/lpjOMppzID
 zGpLW6xlhs2eIVVkQm7VD/4jFld+RT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Rd7IsiSjOY2MUWNuakLiow-1; Fri, 08 Nov 2019 08:43:36 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69BA41800D7B;
 Fri,  8 Nov 2019 13:43:33 +0000 (UTC)
Received: from redhat.com (ovpn-123-175.rdu2.redhat.com [10.10.123.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57C09196AE;
 Fri,  8 Nov 2019 13:43:30 +0000 (UTC)
Date: Fri, 8 Nov 2019 08:43:28 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191108134328.GA4456@redhat.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107200604.GB21728@mellanox.com>
 <20191108063302.GA18778@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20191108063302.GA18778@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Rd7IsiSjOY2MUWNuakLiow-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: Re: [Nouveau] [PATCH v2 02/15] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Nov 07, 2019 at 10:33:02PM -0800, Christoph Hellwig wrote:
> On Thu, Nov 07, 2019 at 08:06:08PM +0000, Jason Gunthorpe wrote:
> > > =

> > > enum mmu_range_notifier_event {
> > > 	MMU_NOTIFY_RELEASE,
> > > };
> > > =

> > > ...assuming that we stay with "mmu_range_notifier" as a core name for=
 this =

> > > whole thing.
> > > =

> > > Also, it is best moved down to be next to the new MNR structs, so tha=
t all the
> > > MNR stuff is in one group.
> > =

> > I agree with Jerome, this enum is part of the 'struct
> > mmu_notifier_range' (ie the description of the invalidation) and it
> > doesn't really matter that only these new notifiers can be called with
> > this type, it is still part of the mmu_notifier_range.
> > =

> > The comment already says it only applies to the mmu_range_notifier
> > scheme..
> =

> In fact the enum is entirely unused.  We might as well just kill it off
> entirely.

I had patches to use it, i need to re-post them. I posted them long ago
and i droped the ball. I will re-spin after this.

Cheers,
J=E9r=F4me

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
