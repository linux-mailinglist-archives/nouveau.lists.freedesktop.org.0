Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C44AC837
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 19:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A05810E403;
	Mon,  7 Feb 2022 18:08:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8F510E403
 for <nouveau@lists.freedesktop.org>; Mon,  7 Feb 2022 18:08:40 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so14431801pjb.1
 for <nouveau@lists.freedesktop.org>; Mon, 07 Feb 2022 10:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYdhIytWWvNZPQpgxc7JanMz43mOjz+UXOqpB/Si8gY=;
 b=R93xjTEs3HgPo29762m4uqHy6DgEIiw341Wvf7q57zjQt/fMOf/vIggnLWq+UIkvE2
 ItYfM1ocg4jOoHter+LGmVVn+56WIrTresjlRqOzDpxhR2gE2Z7XKfivMQnYws3oBpcN
 Wnp4OjEX2kVSHOm5wWUaWUQHoBL2pZOajsCNpVYP+2s7M4Pt370NfYYH6tCLMb0ePa8z
 HUeyronXi33SaNNHMgqIF/E3v+pRpLWgtLiP7uZ593CHEdxKAHCZRXlItwp/sNFJZgmH
 Q6m9V+2GxeMGSIE/EyF8AlQqUfCTIeQOL4NCF8eo53fHgen+/6rfpdiFIvCtnwfrEBzm
 8haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYdhIytWWvNZPQpgxc7JanMz43mOjz+UXOqpB/Si8gY=;
 b=L9yHVmqmQn//9Vp90seB457TDAo0N+o1UGRzamuDqSDnIIjlkiRuzC4MBb6bbyQhoI
 YFca9Z1illBE63j3J/2W0dSQ0V86hLdSLwBh29tqCcuN8YrbZg97MvdaAn95Laxpz2pf
 l6xr7tBJ5G78EOdqElL0Sqx3ZPCL+q2Zyt0XMIuy37v/OD4zKzIZsuT1H6w2K4Ngi1ev
 SHQkRNE+KO1BGvMO1WNNyEg2ywU6JJqrognmAeswUWER5ze1dxSGZfm0k82h0lHdyebm
 ZQYqjcTNFOk5kUn4xsV+jJTy5aR6yz+PxdScSLyK5MvLb+Fxog1e98zAPx3h4G+zNITJ
 O90Q==
X-Gm-Message-State: AOAM532+IkTG9JGkF4dWMPOJ24+2nU3CP930djjkFfPHHMC9VYA6gIYU
 Bh2WlSf3WW58hRJHUdU0euI5HWBJZxJi0Xe40enYag==
X-Google-Smtp-Source: ABdhPJzkFzzjmqODkvgrvwQLNfbzdHBUvOVv75drXwoWtoHzOi4Qr8amdduzRjHB4i+xpu3YrgRs1ma/CEMYchNDNj0=
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr121877pjb.93.1644257320409; 
 Mon, 07 Feb 2022 10:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-3-hch@lst.de>
In-Reply-To: <20220207063249.1833066-3-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 10:08:29 -0800
Message-ID: <CAPcyv4i3hJR9WBh6PFN9VgA0p3x4Vvgdy6T3b-3_bP_LaPK9fg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 2/8] mm: remove the __KERNEL__ guard from
 <linux/mm.h>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Feb 6, 2022 at 10:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> __KERNEL__ ifdefs don't make sense outside of include/uapi/.

Yes.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
