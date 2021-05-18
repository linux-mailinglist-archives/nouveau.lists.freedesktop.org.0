Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A83881AD
	for <lists+nouveau@lfdr.de>; Tue, 18 May 2021 22:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6D96ECA2;
	Tue, 18 May 2021 20:51:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADD36EC5B
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621360902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oue7U1wjftn7xVwPmUZCJccBeCJY9jE5A9d8yc2+hO4=;
 b=hdmPNN+69WNODzQFE+Gsjohg3krgpFRqEYWLUhhFFaIAV+RO7G2Zzr2SCfQnG7fKzOiV+R
 bBojKJ+7ghicw9Gc0vZ7cWJB4NjcSNhdDhyhPtuRGP9SPRkJMpVgzyd7WNY9uG5vl97xP1
 +aYr86n2WmBCpsx84JESVDSvQCtnC08=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-RHbK_Z5cM0Cq9YffTP4I-Q-1; Tue, 18 May 2021 14:01:39 -0400
X-MC-Unique: RHbK_Z5cM0Cq9YffTP4I-Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 s68-20020a372c470000b0290305f75a7cecso7764941qkh.8
 for <nouveau@lists.freedesktop.org>; Tue, 18 May 2021 11:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Oue7U1wjftn7xVwPmUZCJccBeCJY9jE5A9d8yc2+hO4=;
 b=DB8wj2LTyDE8VsIT2C6Cotssuew8G7cxN0FmO8urk9JOu9Td6N6I95hTEAMm8Lkt7p
 JuwEFOqdFdsS5qjdnqVNMHF9/j3vPmmvauNnQSaYhKbhmqOCFIL5wYeUxOfKd1lMJKJR
 aZxJxGM8rp3u/dVxLKwJvV4wW1tHhA9U8JKnhF9ieK+5dKzSKjytNhQmiVRdPKgSCT3/
 BuL6GB/alLv40/5Nba+OXiYzqN4jZElVMTDHGNbytG760p9m4Khz/Pl+xGZiB3eaTexv
 5NADWaj7tkIF730rs+II/FIeMkJfDdFwg81UPT236uVNAjCi3XegotULOncGNVdGPt9x
 b0GQ==
X-Gm-Message-State: AOAM5338kwxQYFjnp+f/Vv4Z/aefvX28ijMjP3aZ/ngPVJpf0W4IEEvq
 yF+VFFWoHCHSCDatMU+8v0quAuMA+67O2Ca++7khgllsrkOp+mtj0hWw0Vs4w168QpznJ4k4zxu
 7HE554o1lVVa1L62matwJypMbyA==
X-Received: by 2002:ac8:a49:: with SMTP id f9mr6060390qti.157.1621360898457;
 Tue, 18 May 2021 11:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTICgj8/egwsE0Ivgqvw8kGv1T8HxyWhbScHPLgGtw0FYHBEe8vymzLu/hxY0OnGRaALaW5w==
X-Received: by 2002:ac8:a49:: with SMTP id f9mr6060354qti.157.1621360898147;
 Tue, 18 May 2021 11:01:38 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id b23sm1488671qtp.7.2021.05.18.11.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:01:37 -0700 (PDT)
Date: Tue, 18 May 2021 14:01:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <YKQBACJCjsxeM3ro@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210518173334.GE1002214@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 18 May 2021 20:51:34 +0000
Subject: Re: [Nouveau] [PATCH v8 5/8] mm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, daniel@ffwll.ch, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 02:33:34PM -0300, Jason Gunthorpe wrote:
> On Tue, May 18, 2021 at 01:27:42PM -0400, Peter Xu wrote:
> 
> > I also have a pure and high level question regarding a process fork() when
> > there're device exclusive ptes: would the two processes then own the device
> > together?  Is this a real usecase?
> 
> If the pages are MAP_SHARED then yes. All VMAs should point at the
> same device_exclusive page and all VMA should migrate back to CPU
> pages together.

Makes sense.  If we keep the anonymous-only in this series (I think it's good
to separate these), maybe we can drop the !COW case, plus some proper installed
WARN_ON_ONCE()s.

> 
> > Indeed it'll be odd for a COW page since for COW page then it means after
> > parent/child writting to the page it'll clone into two, then it's a mistery on
> > which one will be the one that "exclusived owned" by the device..
> 
> For COW pages it is like every other fork case.. We can't reliably
> write-protect the device_exclusive page during fork so we must copy it
> at fork time.
> 
> Thus three reasonable choices:
>  - Copy to a new CPU page
>  - Migrate back to a CPU page and write protect it
>  - Copy to a new device exclusive page

IMHO the ownership question would really help us to answer this one..

If the device ownership should be kept in parent IMHO option (1) is the best
approach. To be explicit on page copy: we can do best-effort, even if the copy
is during a device atomic operation, perhaps?

If the ownership will be shared, seems option (3) will be easier as I don't see
a strong reason to do immediate restorinng of ptes; as long as we're careful on
the refcounting.

Thanks,

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
