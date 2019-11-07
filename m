Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E312B2F0
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD37E6E35F;
	Fri, 27 Dec 2019 08:14:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE16B6F7C9
 for <nouveau@lists.freedesktop.org>; Thu,  7 Nov 2019 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573160663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/OUHbhjqmo/2b88pcHR1Lly3F7Wmo3w1j9CIvENsK0=;
 b=NDeEeK3qbUyoAUkRsr3UXwzZV5PS5ToJzW06SWyKnMFjiacGhE9K+j2OldUN0lnFI+t/pn
 Do4hh5UQ+2NCgavjXOZkVM7bMp0SB787fiVF6dEmkNGpr+9Jx061HIyc5kPc2D8geB846j
 zDNlIya1I86FWfqYL8qiz9AUG1ORDN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-5mTC5mxRONi9JJNT1c4IYQ-1; Thu, 07 Nov 2019 16:04:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08CED1005500;
 Thu,  7 Nov 2019 21:04:14 +0000 (UTC)
Received: from redhat.com (ovpn-122-19.rdu2.redhat.com [10.10.122.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E81285C548;
 Thu,  7 Nov 2019 21:04:10 +0000 (UTC)
Date: Thu, 7 Nov 2019 16:04:08 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20191107210408.GA4716@redhat.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107020807.GA747656@redhat.com>
 <20191107201102.GC21728@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191107201102.GC21728@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 5mTC5mxRONi9JJNT1c4IYQ-1
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
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
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

On Thu, Nov 07, 2019 at 08:11:06PM +0000, Jason Gunthorpe wrote:
> On Wed, Nov 06, 2019 at 09:08:07PM -0500, Jerome Glisse wrote:
> =

> > > =

> > > Extra credit: IMHO, this clearly deserves to all be in a new mmu_rang=
e_notifier.h
> > > header file, but I know that's extra work. Maybe later as a follow-up=
 patch,
> > > if anyone has the time.
> > =

> > The range notifier should get the event too, it would be a waste, i thi=
nk it is
> > an oversight here. The release event is fine so NAK to you separate eve=
nt. Event
> > is really an helper for notifier i had a set of patch for nouveau to le=
verage
> > this i need to resucite them. So no need to split thing, i would just f=
orward
> > the event ie add event to mmu_range_notifier_ops.invalidate() i failed =
to catch
> > that in v1 sorry.
> =

> I think what you mean is already done?
> =

> struct mmu_range_notifier_ops {
> 	bool (*invalidate)(struct mmu_range_notifier *mrn,
> 			   const struct mmu_notifier_range *range,
> 			   unsigned long cur_seq);

Yes it is sorry, i got confuse with mmu_range_notifier and mmu_notifier_ran=
ge :)
It is almost a palyndrome structure ;)

> =

> > No it is always odd, you must call mmu_range_set_seq() only from the
> > op->invalidate_range() callback at which point the seq is odd. As well
> > when mrn is added and its seq first set it is set to an odd value
> > always. Maybe the comment, should read:
> > =

> >  * mrn->invalidate_seq is always, yes always, set to an odd value. This=
 ensures
> > =

> > To stress that it is not an error.
> =

> I went with this:
> =

> 	/*
> 	 * mrn->invalidate_seq must always be set to an odd value via
> 	 * mmu_range_set_seq() using the provided cur_seq from
> 	 * mn_itree_inv_start_range(). This ensures that if seq does wrap we
> 	 * will always clear the below sleep in some reasonable time as
> 	 * mmn_mm->invalidate_seq is even in the idle state.
> 	 */

Yes fine with me.

[...]

> > > > +	might_lock(&mm->mmap_sem);
> > > > +
> > > > +	mmn_mm =3D smp_load_acquire(&mm->mmu_notifier_mm);
> > > =

> > > What does the above pair with? Should have a comment that specifies t=
hat.
> > =

> > It was discussed in v1 but maybe a comment of what was said back then w=
ould
> > be helpful. Something like:
> > =

> > /*
> >  * We need to insure that all writes to mm->mmu_notifier_mm are visible=
 before
> >  * any checks we do on mmn_mm below as otherwise CPU might re-order wri=
te done
> >  * by another CPU core to mm->mmu_notifier_mm structure fields after th=
e read
> >  * belows.
> >  */
> =

> This comment made it, just at the store side:
> =

> 	/*
> 	 * Serialize the update against mmu_notifier_unregister. A
> 	 * side note: mmu_notifier_release can't run concurrently with
> 	 * us because we hold the mm_users pin (either implicitly as
> 	 * current->mm or explicitly with get_task_mm() or similar).
> 	 * We can't race against any other mmu notifier method either
> 	 * thanks to mm_take_all_locks().
> 	 *
> 	 * release semantics on the initialization of the mmu_notifier_mm's
>          * contents are provided for unlocked readers.  acquire can only =
be
>          * used while holding the mmgrab or mmget, and is safe because on=
ce
>          * created the mmu_notififer_mm is not freed until the mm is
>          * destroyed.  As above, users holding the mmap_sem or one of the
>          * mm_take_all_locks() do not need to use acquire semantics.
> 	 */
> 	if (mmu_notifier_mm)
> 		smp_store_release(&mm->mmu_notifier_mm, mmu_notifier_mm);
> =

> Which I think is really overly belaboring the typical smp
> store/release pattern, but people do seem unfamiliar with them...

Perfect with me. I think also sometimes you forgot what memory model is
and thus store/release pattern do, i know i do and i need to refresh my
mind.

Cheers,
J=E9r=F4me

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
