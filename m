Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1354232D0
	for <lists+nouveau@lfdr.de>; Tue,  5 Oct 2021 23:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03736E45E;
	Tue,  5 Oct 2021 21:27:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB666E45E
 for <nouveau@lists.freedesktop.org>; Tue,  5 Oct 2021 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633469253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PwFfE+Y5InXuG9Mab93GHBXLo4VdByGAgXtkzB6nG04=;
 b=fHfdka/zfLwvLoBw7UygiX9NKpcVNSmzjMELbxOBetR9ukDCce9zyQzD1IYr/e1Baso3nZ
 DNEOqwqKjws0E/CrXd+ignQFbV1c49S8AWdWuJ9nb6DZ0g9a31pieiEbnIKG8QiIEJ0Uqs
 UZL36cdNKhH/cUVpogjq5M/NNAPkeD4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-XO52MwgWNWqIgTkPz-lRiA-1; Tue, 05 Oct 2021 17:27:32 -0400
X-MC-Unique: XO52MwgWNWqIgTkPz-lRiA-1
Received: by mail-wr1-f72.google.com with SMTP id
 n18-20020adff092000000b001609d9081d4so344335wro.18
 for <nouveau@lists.freedesktop.org>; Tue, 05 Oct 2021 14:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwFfE+Y5InXuG9Mab93GHBXLo4VdByGAgXtkzB6nG04=;
 b=pzLh6rCXKcOtU19KFy8MEZxcsi/ryinLQXKZRCoGgbIjEx5Rqts8U9jeoDWpauqy7G
 55tuwvAVXeteu3p76kcuqw430Avf0Hlt6y+nr3eGDNnMBNGrVJJCYofUtoxHE5ZDDJr2
 OEUS66FgjsQGh2/J4BdXXdbHkQyoUZsxbUhcJBcgoF9uWjaLaACeZZkjXtNnZR1ilKPc
 w+pIaYdu9kxBfxnuAN14QYcGJS10Pi4zpWSG5HIpOf87Y/RJ7NXFGCybJHkwnGtq8qxu
 WKXm3o/bc76meyC0nkKzTnbmkjZeXzJQDamsy4BjEhWCA9wzZumvRkGl6vRjBWK8tBGd
 +Wjw==
X-Gm-Message-State: AOAM530W1+vw2SHRijn7SGGFTYKf0erralBuxaa/lgjp2jZl2Gi+o1VX
 9Z/T5yKdHC6jbKar6J1j0ketqiH0yG/DO+MVl7sCa3m6xDfLA5ykWowzFgQjBnyJ7bID+GL0dpC
 GK2eRvSKf6ClBVQxX3xHHdtLgE9UPjqGRQ6E+wnX5lg==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr6013047wmk.141.1633469251530; 
 Tue, 05 Oct 2021 14:27:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI6arb7Nu/LjPRQIeObx0l28qGXQBbA7WeXp9gAXr9AfEhUSIm9b8jErwZn57n5uHfE3BhTGBeeSFglHTNUn4=
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr6013031wmk.141.1633469251335; 
 Tue, 05 Oct 2021 14:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210907122633.16665-1-cymi20@fudan.edu.cn>
In-Reply-To: <20210907122633.16665-1-cymi20@fudan.edu.cn>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 5 Oct 2021 23:27:20 +0200
Message-ID: <CACO55tvUuZJD_AOgxS=Ts3MBhXkJARwWapF6QaxQqTk0JG7zWQ@mail.gmail.com>
To: Chenyuan Mi <cymi20@fudan.edu.cn>
Cc: yuanxzhang@fudan.edu.cn, Xiyu Yang <xiyuyang19@fudan.edu.cn>, 
 Xin Tan <tanxin.ctf@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/svm: Fix refcount leak bug and
 missing check against null bug
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

I think it makes sense to add a Fixes tag to this:

Fixes: 822cab6150d3 ("drm/nouveau/svm: check for SVM initialized
before migrating")
Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Tue, Sep 7, 2021 at 3:20 PM Chenyuan Mi <cymi20@fudan.edu.cn> wrote:
>
> The reference counting issue happens in one exception handling path of
> nouveau_svmm_bind(). When cli->svm.svmm is null, the function forgets
> to decrease the refcount of mm increased by get_task_mm(), causing a
> refcount leak.
>
> Fix this issue by using mmput() to decrease the refcount in the
> exception handling path.
>
> Also, the function forgets to do check against null when get mm
> by get_task_mm().
>
> Fix this issue by adding null check after get mm by get_task_mm().
>
> Signed-off-by: Chenyuan Mi <cymi20@fudan.edu.cn>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index b0c3422cb01f..9985bfde015a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -162,10 +162,14 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>          */
>
>         mm = get_task_mm(current);
> +       if (!mm) {
> +               return -EINVAL;
> +       }
>         mmap_read_lock(mm);
>
>         if (!cli->svm.svmm) {
>                 mmap_read_unlock(mm);
> +               mmput(mm);
>                 return -EINVAL;
>         }
>
> --
> 2.17.1
>

