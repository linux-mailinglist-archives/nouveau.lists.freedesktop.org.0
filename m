Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B23B5118
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586296E141;
	Sun, 27 Jun 2021 03:34:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D3C6EE12
 for <nouveau@lists.freedesktop.org>; Thu, 10 Jun 2021 23:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623366268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kn4921Fy2QxClPboKoVBlarBT42fXZONHXvZsMc4G14=;
 b=OspLjVdBrTS0a31bZ/j7D4WtHZ3kkzTZ3ogiNMWyOcex8w00P94RpQ7B0fNDNT5WxWmuGa
 8nGtngbAfzXDG/K1Ky5BZ5r2xGS0PfbfZ+oDeJpbbo/Dp8+jKkW7jygmJOIlrsH/JT7cx3
 bUQnmUFp4PV4dvDMDqCY4WhHRSvUFNY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-KqYHAhRwPxCSGlAuvHBzpw-1; Thu, 10 Jun 2021 19:04:22 -0400
X-MC-Unique: KqYHAhRwPxCSGlAuvHBzpw-1
Received: by mail-qt1-f200.google.com with SMTP id
 b20-20020ac87fd40000b02901e1370c5e12so808460qtk.17
 for <nouveau@lists.freedesktop.org>; Thu, 10 Jun 2021 16:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kn4921Fy2QxClPboKoVBlarBT42fXZONHXvZsMc4G14=;
 b=sLPYxvACo6AyNKxy8DOReJjcS21usZ0dPnjPv0bqzvp8KP2X5EXf1gwVoOy3NAZPwl
 xtrAun9FEz8gPgV3np/iFUdadO0ou2UxDw8EqJ4tH4awiIm9Co88andssU1auYRwNipV
 f3svSqO/1cbvpUcrkleTu5EzeTL84//T+bJySoUWK7lkiTdALCbtmd+sWoUx9I/sBUc4
 HrL7a7dh6N7vOHcos0MuLQKlgptb2shvyggW4xxN057hNhtnyBYXvZw0PAevSG4GQxb5
 PAX5IGnPdwJYcvEZWU4HIw2wDlkM69l7KW5bdxcmVy86cs2TdqtAjPxYBJ/Us19XuS5D
 uONQ==
X-Gm-Message-State: AOAM531LAx9KijQ99nZG+QR0nJc3VhkhCk3o06vcoKUjlzZtzgz/oyp7
 28u4hbCoP+HU+7zQfgp05CksWxsT8zmwvDe6wO3fCZbfwk+1BdLY2StnEJm+HxJMyxkV8pyydcK
 tUEYue2/FMLYbQH+tgptLvM3Oog==
X-Received: by 2002:a05:620a:1116:: with SMTP id
 o22mr1055482qkk.263.1623366261643; 
 Thu, 10 Jun 2021 16:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrG/yfGVS5sWgTKcNo1dgRgBZLWinZ0GsXIy0VHGuGgZrohA7iNbV+b0qys3C0GTOZDsvbFg==
X-Received: by 2002:a05:620a:1116:: with SMTP id
 o22mr1055448qkk.263.1623366261403; 
 Thu, 10 Jun 2021 16:04:21 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id j14sm3076434qtj.96.2021.06.10.16.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 16:04:20 -0700 (PDT)
Date: Thu, 10 Jun 2021 19:04:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YMKacyNstEM9brUD@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <2773835.D95cIkl9rl@nvdebian> <YMJUM4sx1VclR7oz@t490s>
 <6429491.QiJgnDeYu7@nvdebian>
MIME-Version: 1.0
In-Reply-To: <6429491.QiJgnDeYu7@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH v10 07/10] mm: Device exclusive memory access
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > internally which will generate that unwanted CLEAR notify.
> 
> Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> finds a thp pmd. In follow_pmd_mask() we have:
> 
> 	if (likely(!pmd_trans_huge(pmdval)))
> 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> 
> So I don't think we have a problem here.

Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
and do the split, then the CLEAR notify.  Hmm.. Did I miss something?

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
