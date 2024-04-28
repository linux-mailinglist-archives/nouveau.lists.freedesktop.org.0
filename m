Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF98B4C80
	for <lists+nouveau@lfdr.de>; Sun, 28 Apr 2024 17:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129B810E80A;
	Sun, 28 Apr 2024 15:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B9ls95wy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105F310E80A
 for <nouveau@lists.freedesktop.org>; Sun, 28 Apr 2024 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714319571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jinJJoor3YB1qBkufT8oXNRgzm94YoKfoDZOaqdyciY=;
 b=B9ls95wyWMpnwZ1fHI3GNwaTu0QNgn6WhKrm2nT+VzkmmOIYzYOlyfbnmZahOcC3adPJE3
 4K8Mb0R3z0sDZUNXanVKAufrmh/U8gldSuiL/lJNTJVKo0cZi1kq9ByXkjVnlBIWTojqYl
 ozKp4s91BR6o6Es1l/w8kn8zD1FDuJY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-P-mrM6UIN2CMoALzATArSw-1; Sun, 28 Apr 2024 11:52:50 -0400
X-MC-Unique: P-mrM6UIN2CMoALzATArSw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7909bc5790aso534023785a.0
 for <nouveau@lists.freedesktop.org>; Sun, 28 Apr 2024 08:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714319569; x=1714924369;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pZykVLyPTHNf2oLD7SWZNyhDuAGshWhY8pTDiUHRDL8=;
 b=F/nTcSm/DujIyYr56c1UVvQHQU9BBI2LXuYq3nQiCBjK2NXI2dD/ZXmYFabbBCd2nm
 41pAem4/IhI7z9PpMd5ym6eOHNt4jATK7q/XaWEE1Ymj2iQNBgIVtQo7ZaxqkG4f05Hd
 U7+VvFipWFAE+334RqdWUfFTbTGs+EP4UsZ8BB392FQL5fdL0u96G5ZUN2Uvpeah5fRh
 iiiEERu4kckWolmIITolkkwpasIC9p/ctqL5Z6h6vnC8sPb4p8dZsnCtg8vfvOauBOky
 ZTw2DbJu97bhpKdTJLfjKY1vIATToQhfPP8kklXYV6yV6lzQIqwu8ocJUDWfEWyEWcfr
 sYdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj/b0YwyBZZpYr7gZC8ysZTnkkidwaQHL6gnKJ8m7oFEnYCd9dAL2eREFP86uly/yQLL0bGsZRk+EFbeqprbVfqnNPoM/EYVg6bQMFYw==
X-Gm-Message-State: AOJu0YylgkUJ2RxSmf845LoEYSDT58x7fH1aarW7OVqhKK+HYLLBh1Bq
 JLX/UxXN+G340b9h6J+oymO9TqFwlu4U1n7fy8fsmunksE4kqsBX/pxhfbW5F4ogwMt5HaENiCx
 SO9FZVEXWmquEJrmuRRzEOuDukGx8H3Q62wkcY6Hm2CCn1ulNwXRms/5g+1iIvmU=
X-Received: by 2002:a05:620a:2415:b0:790:f40f:e24e with SMTP id
 d21-20020a05620a241500b00790f40fe24emr1246035qkn.22.1714319569615; 
 Sun, 28 Apr 2024 08:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4L7xUX8yYGMYzxvIA1MdWkvVCmQ2dXjpZqYB5j1wO4eQWjPg8MkRG9IFPdeS3YyjYksF1qw==
X-Received: by 2002:a05:620a:2415:b0:790:f40f:e24e with SMTP id
 d21-20020a05620a241500b00790f40fe24emr1246022qkn.22.1714319569338; 
 Sun, 28 Apr 2024 08:52:49 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c6c:a300::789])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05620a20d200b0078eaf335331sm9718788qka.77.2024.04.28.08.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 08:52:48 -0700 (PDT)
Message-ID: <35b0ffe54f5e4077d5ebee6b82ae9ccd568dd77d.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau/firmware: Fix SG_DEBUG error with
 nvkm_firmware_ctor()
From: Lyude Paul <lyude@redhat.com>
To: Timur Tabi <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>, "kherbst@redhat.com"
 <kherbst@redhat.com>, "airlied@redhat.com" <airlied@redhat.com>, 
 "justinstitt@google.com" <justinstitt@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "keescook@chromium.org" <keescook@chromium.org>, "airlied@gmail.com"
 <airlied@gmail.com>,  "dakr@redhat.com" <dakr@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Date: Sun, 28 Apr 2024 11:52:47 -0400
In-Reply-To: <4294e43a0165a36a063d74c7ef62fbdeb156f8c4.camel@nvidia.com>
References: <20240426154138.64643-1-lyude@redhat.com>
 <4294e43a0165a36a063d74c7ef62fbdeb156f8c4.camel@nvidia.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 2024-04-26 at 15:47 +0000, Timur Tabi wrote:
> On Fri, 2024-04-26 at 11:41 -0400, Lyude Paul wrote:
> > We hit this because when initializing firmware of type
> > NVKM_FIRMWARE_IMG_DMA we allocate coherent memory and then attempt
> > to
> > include that coherent memory in a scatterlist.=20
>=20
> I'm sure this patch is a good one, and I will try to test it soon,
> but I am
> very curious to know why including coherent memory in a scatterlist
> is bad.

Thanks for asking this as I think you unintentionally pointed out this
explanation I gave doesn't make sense - so I looked a bit more into it.
The issue isn't coherent memory in the scatterlist, the issue is that
we're allocating with dma_alloc_coherent(). And according to the source
in dma_alloc_attrs() (which dma_alloc_coherent() is just a wrapper)
for):

   /*
    * DMA allocations can never be turned back into a page pointer, so
    * requesting compound pages doesn't make sense (and can't even be
    * supported at all by various backends).
    */
   if (WARN_ON_ONCE(flag & __GFP_COMP))
   =09return NULL;

Which explains the check in sg_set_buf() that this patch stops us from
hitting:

   BUG_ON(!virt_addr_valid(buf));

Scatterlists need page pointers (we use one later down here:)

   sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));

But we can't get a page pointer from an allocation made by
dma_alloc_coherent() - but we can from vmalloc(). I'll fix the patch
explanation in the next version, I have to send out another version
anyhow since I realized that patch #2 still needs one more check to
work properly
--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

