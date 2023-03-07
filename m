Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC256AF990
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 23:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3342810E56B;
	Tue,  7 Mar 2023 22:50:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD4F10E56B
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678229434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CwqCYxprrLNIAPoFL/afLE+315Wy6YvL00aG4lbDww0=;
 b=Z2eKIOX62dQMiHXh3qd/grnVflzGnrndQ1T3CNRTFB/v3QMr+fJRMhOuadi6dAnVjj5rpl
 lXT1Ud9RCkABHp8JEUEI//2N6sOquq671lz9tqrnJuraVz7msuovoyaE6dnH5/74RPJoTD
 mnBw5NX9y3Wd9UATT79T7blOhO03Dl8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-z_B2hZlKPJO-MbYoGWZIqQ-1; Tue, 07 Mar 2023 17:50:33 -0500
X-MC-Unique: z_B2hZlKPJO-MbYoGWZIqQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 c15-20020a37e10f000000b00741a3333881so8357069qkm.13
 for <nouveau@lists.freedesktop.org>; Tue, 07 Mar 2023 14:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229432;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2LyFwXcQIcYGF8iAkhqDIIxOMMkwRfJpuYXazPS08Y=;
 b=5L6+emJ93AlP+7+cRrj8IubarkMhhfkW9sHuAuV4Bc+a41LsCk8s5UKC9tvPOPY0Nz
 hNLikA/pJNg5xS14NhsHhWbBRfkWX2uAqGXTQJNeaJkWEdbkIhyeXrlfO6fEXsg1tHwk
 kFC8buRlv6ptIqQaxc2rnA25xYc1ZULzG7WmIkFQb170lth5mD6w6oCzwr302QIeSPAR
 0MzXc+q9B+Qjqax94wybPtOzi3zY2BOWSDG49iLhq6wUuRmTjsRIP4tQ/Kr7CqdFJOjD
 kLQCZjt57SmXDvWDGpw+XL/EApsuylSVG4UskIMmQS64qO1nUHx7Ka080z/tWwM+CQ6S
 m/lg==
X-Gm-Message-State: AO0yUKU56VZjp0mfoFceb8mxhh4R9tpGQi3TKN3y0QJQS6ZozK0/JgsR
 VojfUUpC1DYAYkMIuW0e4JEMHOF5XJY96ZbFDBGsOm03B7Fi0DSWdTEBFutwYxiZpnCpHmzS6/L
 uCP/lgnX/BcuErmmVXN0YkKgZhQ==
X-Received: by 2002:ac8:5f83:0:b0:3bf:d07e:edf6 with SMTP id
 j3-20020ac85f83000000b003bfd07eedf6mr29489386qta.36.1678229432665; 
 Tue, 07 Mar 2023 14:50:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+fAl+u8fQ2G5Wb7L0bClfPehMChq1xc2zVWkDzlMZ5FpEupjFrdvUmM3UqA5658lgeZF5ZsQ==
X-Received: by 2002:ac8:5f83:0:b0:3bf:d07e:edf6 with SMTP id
 j3-20020ac85f83000000b003bfd07eedf6mr29489358qta.36.1678229432411; 
 Tue, 07 Mar 2023 14:50:32 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac867cf000000b003bfc2fc3235sm10349179qtp.67.2023.03.07.14.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:50:31 -0800 (PST)
Message-ID: <ba3790cb9f3adcb4f7d3935ce9aa88ecacb3bf7d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jakob Koschel <jkl820.git@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Tue, 07 Mar 2023 17:50:30 -0500
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-2-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
 <20230301-drm-nouveau-avoid-iter-after-loop-v1-2-0702ec23f970@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 2/2] drm/nouveau/clk: avoid usage of list
 iterator after loop
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2023-03-01 at 18:25 +0100, Jakob Koschel wrote:
> +=09=09}
> =C2=A0=09}
> =C2=A0
> +=09BUG_ON(!pstate);
> =C2=A0=09nvkm_debug(subdev, "setting performance state %d\n", pstatei);
> =C2=A0=09clk->pstate =3D pstatei;

We should probably also replace this with

=09if (WARN_ON(!pstate)
=09=09return -EINVAL;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

