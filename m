Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB73F64D4
	for <lists+nouveau@lfdr.de>; Tue, 24 Aug 2021 19:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8BA6E077;
	Tue, 24 Aug 2021 17:07:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9636E07F
 for <nouveau@lists.freedesktop.org>; Tue, 24 Aug 2021 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629824833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+EkvRCjisgW9/FJYFVpuRO5Po0oLsZ90ivwhF4hpSs=;
 b=MKehmYUB8VetbESB5H6z8ubMsEEmZ0IXkNJtji2rmMVWyp6x/17gXOANYUeBKxaL36q2yq
 fqABETeJyC6FgZDo3KcOOCPf6mYRdo2vT/lbTtVqb376KaE7B4Hb/rao/Ag3TdgbDofehc
 tq7/a0LZ+nBFMce9lVwcYz9GZpds/Yw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-sJdpbiLONdafCKvqx66WSQ-1; Tue, 24 Aug 2021 13:07:08 -0400
X-MC-Unique: sJdpbiLONdafCKvqx66WSQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 q19-20020ac87353000000b0029a09eca2afso10928760qtp.21
 for <nouveau@lists.freedesktop.org>; Tue, 24 Aug 2021 10:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=M+EkvRCjisgW9/FJYFVpuRO5Po0oLsZ90ivwhF4hpSs=;
 b=HSd2VWmovF5dQBzwkY9uvt2aAJXXw8/YOTbJzZg6M0GVPVS5cwFucCjGQdXZPaBLSY
 daDc7wDR4zKIWLbU1+mp4V7PYKEDqFQW6+s9aIqv4NLsFm477Od1mGmkjAtb06V5WQ9J
 gB2oycyQ0VUPXmV8p22piWRWZBqzcXWm7brjyrfWqIkoJvxmEOjIqjH+Vc/uUjWGPrwo
 fh50suLZstdKnCe+9HVdgv2L0WXpnZNeqw2orRPJS/tybrJNud2nGEqE7lX+r0HRxFQp
 dlQpOjRCvdD5vWS15XYAn5EzzSrAdDSXj3PSmNfUzy3u/38CLwK+4pQVeRMOyQgVDD19
 IZAw==
X-Gm-Message-State: AOAM531yub7O4Xb5Gvqkt4KTtqfAiA3G5NAz1dUgYT3wSaY9Gui136zt
 A7k+yNFSR+Q3za/L/UxWMQwI9Hr5KuvZwr6de0/JgADYAERw4jgZ36YJsS7q/InWbfXu46cazla
 fCmNTBiiUvTNNUo8ndrNauyulZg==
X-Received: by 2002:a05:6214:621:: with SMTP id
 a1mr40120501qvx.12.1629824827957; 
 Tue, 24 Aug 2021 10:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjEBLm63jRc4t/L6dw09TUKBT09yP3DkBvnII/qB+rct8Z9iqhYH6ZriYAEHIEzCukdlMCSA==
X-Received: by 2002:a05:6214:621:: with SMTP id
 a1mr40120476qvx.12.1629824827749; 
 Tue, 24 Aug 2021 10:07:07 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id h6sm8211913qtb.44.2021.08.24.10.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:07:07 -0700 (PDT)
Message-ID: <1bd0bb90d6367307ad375d692563c6ba1fc43d50.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Tue, 24 Aug 2021 13:07:06 -0400
In-Reply-To: <20210824005432.631154-16-sashal@kernel.org>
References: <20210824005432.631154-1-sashal@kernel.org>
 <20210824005432.631154-16-sashal@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH AUTOSEL 5.10 16/18] drm/nouveau/kms/nv50:
 workaround EFI GOP window channel format differences
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

Ben, do we even have Ampere support in 5.10?

On Mon, 2021-08-23 at 20:54 -0400, Sasha Levin wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> [ Upstream commit e78b1b545c6cfe9f87fc577128e00026fff230ba ]
> 
> Should fix some initial modeset failures on (at least) Ampere boards.
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 27 +++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/dispnv50/head.c | 13 ++++++++----
>  drivers/gpu/drm/nouveau/dispnv50/head.h |  1 +
>  3 files changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 5b8cabb099eb..c2d34c91e840 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2202,6 +2202,33 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state
> *state)
>                 interlock[NV50_DISP_INTERLOCK_CORE] = 0;
>         }
>  
> +       /* Finish updating head(s)...
> +        *
> +        * NVD is rather picky about both where window assignments can
> change,
> +        * *and* about certain core and window channel states matching.
> +        *
> +        * The EFI GOP driver on newer GPUs configures window channels with
> a
> +        * different output format to what we do, and the core channel
> update
> +        * in the assign_windows case above would result in a state
> mismatch.
> +        *
> +        * Delay some of the head update until after that point to
> workaround
> +        * the issue.  This only affects the initial modeset.
> +        *
> +        * TODO: handle this better when adding flexible window mapping
> +        */
> +       for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
> new_crtc_state, i) {
> +               struct nv50_head_atom *asyh =
> nv50_head_atom(new_crtc_state);
> +               struct nv50_head *head = nv50_head(crtc);
> +
> +               NV_ATOMIC(drm, "%s: set %04x (clr %04x)\n", crtc->name,
> +                         asyh->set.mask, asyh->clr.mask);
> +
> +               if (asyh->set.mask) {
> +                       nv50_head_flush_set_wndw(head, asyh);
> +                       interlock[NV50_DISP_INTERLOCK_CORE] = 1;
> +               }
> +       }
> +
>         /* Update plane(s). */
>         for_each_new_plane_in_state(state, plane, new_plane_state, i) {
>                 struct nv50_wndw_atom *asyw =
> nv50_wndw_atom(new_plane_state);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c
> b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 841edfaf5b9d..61826cac3061 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -49,11 +49,8 @@ nv50_head_flush_clr(struct nv50_head *head,
>  }
>  
>  void
> -nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
> +nv50_head_flush_set_wndw(struct nv50_head *head, struct nv50_head_atom
> *asyh)
>  {
> -       if (asyh->set.view   ) head->func->view    (head, asyh);
> -       if (asyh->set.mode   ) head->func->mode    (head, asyh);
> -       if (asyh->set.core   ) head->func->core_set(head, asyh);
>         if (asyh->set.olut   ) {
>                 asyh->olut.offset = nv50_lut_load(&head->olut,
>                                                   asyh->olut.buffer,
> @@ -61,6 +58,14 @@ nv50_head_flush_set(struct nv50_head *head, struct
> nv50_head_atom *asyh)
>                                                   asyh->olut.load);
>                 head->func->olut_set(head, asyh);
>         }
> +}
> +
> +void
> +nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
> +{
> +       if (asyh->set.view   ) head->func->view    (head, asyh);
> +       if (asyh->set.mode   ) head->func->mode    (head, asyh);
> +       if (asyh->set.core   ) head->func->core_set(head, asyh);
>         if (asyh->set.curs   ) head->func->curs_set(head, asyh);
>         if (asyh->set.base   ) head->func->base    (head, asyh);
>         if (asyh->set.ovly   ) head->func->ovly    (head, asyh);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h
> b/drivers/gpu/drm/nouveau/dispnv50/head.h
> index dae841dc05fd..0bac6be9ba34 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
> @@ -21,6 +21,7 @@ struct nv50_head {
>  
>  struct nv50_head *nv50_head_create(struct drm_device *, int index);
>  void nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom
> *asyh);
> +void nv50_head_flush_set_wndw(struct nv50_head *head, struct nv50_head_atom
> *asyh);
>  void nv50_head_flush_clr(struct nv50_head *head,
>                          struct nv50_head_atom *asyh, bool flush);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

