Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BB5626286
	for <lists+nouveau@lfdr.de>; Fri, 11 Nov 2022 21:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E70610E0B4;
	Fri, 11 Nov 2022 20:07:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D68D10E096
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 20:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668197227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ztz/XLY+gVz+oUJ3nFqgwH/snUdD+Aa6fbqfFn0t54Q=;
 b=DrY4YYdHg3KHyXUdkRRXsW89ArIUR9LL+Xw4mFJv6rLxKSPgpiuj8iijzLd7TWDgOv1uXT
 nUN+dBT/Wtv3Ou25EXMvbZOwYu+D4feksSVuic+ypG9UZGH5PPqfuEDXVuzMQd51DHZpiy
 C9HM1xKNtaSyZ+O6pEaTSd/JIIekXoM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-9Ceg6NgCNQCz_whxeh6ZaQ-1; Fri, 11 Nov 2022 15:07:06 -0500
X-MC-Unique: 9Ceg6NgCNQCz_whxeh6ZaQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 az31-20020a05620a171f00b006fa2cc1b0bfso5538952qkb.23
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 12:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ztz/XLY+gVz+oUJ3nFqgwH/snUdD+Aa6fbqfFn0t54Q=;
 b=5r2gxoU7l6ox+ctNfV/kfudh43tVXViQ0l6IQm7EmzZySxyFu3EWYqQZXazEeqTdwF
 LF7dfxbYlZIdaFcfi2MAeMYuauriSgEZnn8oyLZptfJ9xaWKO0bFJrDoZeG0DnzIAZK2
 XQP1pMbR9TTrL3PLTxHE7YB2ZgD5gv5jVIQ0mLZMHFwE66hfHBZqtJDo8DQFC/EsfMD7
 UbRO0N8BzabMpKPEwNbDLG9EEZvlzeayH1nL2T3aPXFdsbGxPwdibd+wZONj8E4ZUL+f
 qjf+9poMIM+XwG2dZcVC3Vp/jm3sVKj/wZAXdQgmsgITrINnEG20pqeha3VvI7Jd4z8i
 el5A==
X-Gm-Message-State: ANoB5pljyZMW0U4dDqBX/Qd5zQ0VQiTO8ntvVN6oDYaXxFGG2Z/HFb0w
 nn75b9oLIcNg8pBojVHbEAWdijxV+xNy/GxlCqNmVj01ssbM+cAVLYbx2be+RdkKi7YBTbcM5VO
 p2hq28WdWt23b27OX1LpAh3roEUtIe6rDUmRUPjR/oQ==
X-Received: by 2002:ad4:5841:0:b0:4b7:ebc1:ecd6 with SMTP id
 de1-20020ad45841000000b004b7ebc1ecd6mr3495817qvb.9.1668197225869; 
 Fri, 11 Nov 2022 12:07:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68Jn9djmiUd4uv1/cfDmbQ+VLUpDoROQzfpclynblmshr7W68Ci6lUZZl77R84XzS9JdKfuZgUrn+NrxImjwc=
X-Received: by 2002:ad4:5841:0:b0:4b7:ebc1:ecd6 with SMTP id
 de1-20020ad45841000000b004b7ebc1ecd6mr3495779qvb.9.1668197225586; Fri, 11 Nov
 2022 12:07:05 -0800 (PST)
MIME-Version: 1.0
References: <202211100850.7A8DD75@keescook> <87iljl6ehe.fsf@intel.com>
 <202211111110.11B554B@keescook>
In-Reply-To: <202211111110.11B554B@keescook>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 11 Nov 2022 21:06:54 +0100
Message-ID: <CACO55tt5KOgDYMEw=spDeoMaYuj2GQOuHU+BEgadr1nQiFOGhw@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Coverity: nouveau_dp_irq(): Null pointer dereferences
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
Cc: "Nathan E. Egge" <unlord@xiph.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 8:21 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Nov 11, 2022 at 11:13:17AM +0200, Jani Nikula wrote:
> > On Thu, 10 Nov 2022, coverity-bot <keescook@chromium.org> wrote:
> > > Hello!
> > >
> > > This is an experimental semi-automated report about issues detected by
> > > Coverity from a scan of next-20221110 as part of the linux-next scan project:
> > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > >
> > > You're getting this email because you were associated with the identified
> > > lines of code (noted below) that were touched by commits:
> > >
> > >   Mon Aug 31 19:10:08 2020 -0400
> > >     a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")
> >
> > Hi Kees, this looks like a good idea, but maybe double check the Cc list
> > generation? I was Cc'd on four mails today that I thought were
> > irrelevant to me.
>
> Hi!
>
> Heh, I was recently asked to _expand_ the CC list. :)
>
> For these last pass of reports, I added a get_maintainers.pl run to the
> identified commit. In this instance, the commit touched:
>
>  drivers/gpu/drm/nouveau/dispnv04/disp.c     |    6 +
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  192 ++++++++++++++++++++++--------------------------
>  drivers/gpu/drm/nouveau/nouveau_connector.c |   14 ---
>  drivers/gpu/drm/nouveau/nouveau_display.c   |    2
>  drivers/gpu/drm/nouveau/nouveau_display.h   |    2
>  drivers/gpu/drm/nouveau/nouveau_dp.c        |  132 ++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/nouveau/nouveau_encoder.h   |   33 +++++++-
>  7 files changed, 244 insertions(+), 137 deletions(-)
>
> And the get_maintainers.pl rationale was:
>
> Ben Skeggs <bskeggs@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:1/1=100%,commit_signer:6/16=38%,authored:4/16=25%,added_lines:23/124=19%,removed_lines:36/152=24%)
> Karol Herbst <kherbst@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:2/1=100%)
> Lyude Paul <lyude@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:9/16=56%,authored:6/16=38%,added_lines:92/124=74%,removed_lines:107/152=70%)
> David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> Ilia Mirkin <imirkin@alum.mit.edu> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,removed_lines:2/2=100%)
> "Nathan E. Egge" <unlord@xiph.org> (commit_signer:1/1=100%)
> Jani Nikula <jani.nikula@intel.com> (commit_signer:6/16=38%)
> Dave Airlie <airlied@redhat.com> (commit_signer:5/16=31%)
> Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/16=25%,authored:4/16=25%)
> dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
> nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
>

I'd say it's good enough to message supporters and the mailing lists
for at least Nouveau code, maybe even all drm drivers.

Not sure what to do about actual maintainers, but I doubt Dave and
Daniel want to be CCed on every Coverity report here either.

Karol

>
> --
> Kees Cook
>

