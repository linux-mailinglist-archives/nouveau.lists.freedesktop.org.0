Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD1805FAC
	for <lists+nouveau@lfdr.de>; Tue,  5 Dec 2023 21:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BBE10E61E;
	Tue,  5 Dec 2023 20:45:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E6110E61B
 for <nouveau@lists.freedesktop.org>; Tue,  5 Dec 2023 20:45:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c0fc1cf3dso16929995e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 05 Dec 2023 12:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701809124; x=1702413924;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Y+jY+0Fv8pe8Zjgn3mhV8qrJZdO/zPS1zfBF2bsh/g=;
 b=fM8lducLZMdpQmmbQVKHnqnd0KSx5R3EuWJOhS7danEXnAciB7cPMX7SuhpCJFW3H1
 YYUpwTtsroWaTRswwlFsf/JwtVmXGEgZ83+MzYiSrthSql77gCGlLLSf8O5xJTQYyDkF
 kjlbBeAbGr9o0kOrQiUfsLZpddres5XtWsDZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701809124; x=1702413924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Y+jY+0Fv8pe8Zjgn3mhV8qrJZdO/zPS1zfBF2bsh/g=;
 b=C8r5Y6MQG4WYGxLHRZRYC7xezjrN+pqBNaJJ5AYPjMG4z2WU0qHlzNVTO0CUU0nbmm
 sqo8vMsz71cA/ADN98z1bwJjOB7hcw/jucyd46tXrzCT1FHyarNCW4YWx3MkEXxUaV/x
 Y4HuualBqvvmqMgOWp+pOzMqVeREIfNtNzwq/tKQ0tW86Af9riyGgOIZMSbXCjmbLfwM
 WNs7jpZOeQdL6a/8qBLKn0EpgN4cLVzXnmzaJ7kknyeqVA6tmcr7wP3+JJHVuaYkauq9
 A5jCs98f8VNzZLoX+iBA6+NQjmVo3vtlyXbyYmgJMqUUd/+56l1OE1vY8zSn0T6hZ1Eb
 CIPA==
X-Gm-Message-State: AOJu0Yze7OUPzuRA8bLBeAcYQELfMIkYL9hKOOranQrOcQTRnzrvsCNs
 8uf04EKm5HsehnUpxvF9/TjAzBERPTkE7Qw9DBKti7Kn
X-Google-Smtp-Source: AGHT+IFYexIbV1wEqg5vGipDAxBLzyDJIHgmhpnFEV17qLuIc9/hL3qkhE5CCp+dGmyn/nsw0+Gang==
X-Received: by 2002:a1c:7214:0:b0:40b:5e21:d346 with SMTP id
 n20-20020a1c7214000000b0040b5e21d346mr970143wmc.79.1701809124496; 
 Tue, 05 Dec 2023 12:45:24 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 i14-20020a170906114e00b00a0180de2797sm7217713eja.74.2023.12.05.12.45.23
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 12:45:24 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so855e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 05 Dec 2023 12:45:23 -0800 (PST)
X-Received: by 2002:a05:600c:4e8d:b0:40a:483f:f828 with SMTP id
 f13-20020a05600c4e8d00b0040a483ff828mr15612wmq.4.1701809123285; Tue, 05 Dec
 2023 12:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.4.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
 <2f7fbd1b606b4d08b8c8c6eefff5898c8faa697c.camel@redhat.com>
 <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
In-Reply-To: <CAD=FV=XkeicQ3Gq4yaFtXsF7yM_7pXbpNKB56DbOwBmsEsrF_g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 12:45:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XDhkstFX3e2qPGeYGkFWefRMH24BjNgRujBX5PQyE6MA@mail.gmail.com>
Message-ID: <CAD=FV=XDhkstFX3e2qPGeYGkFWefRMH24BjNgRujBX5PQyE6MA@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [RFT PATCH v2 04/12] drm/nouveau: Call
 drm_atomic_helper_shutdown() or equiv at shutdown time
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 17, 2023 at 3:00=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Sep 22, 2023 at 2:06=E2=80=AFPM Lyude Paul <lyude@redhat.com> wro=
te:
> >
> > actually very glad to see this because I think I've seen one bug in the=
 wild
> > as a result of things not getting shut down :)
> >
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > Tested-by: Lyude Paul <lyude@redhat.com>
>
> Any idea of where / how this patch should land. Would you expect me to
> land it through drm-misc, or would you expect it to go through someone
> else's tree?

Still hoping to find a way to land this patch, since it's been
reviewed and tested. Would anyone object if I landed it via drm-misc?

-Doug
