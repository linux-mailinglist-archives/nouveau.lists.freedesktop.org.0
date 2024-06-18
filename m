Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C88A90C32C
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2024 07:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2BE10E0BA;
	Tue, 18 Jun 2024 05:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="am81zZYu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 328 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jun 2024 05:39:22 UTC
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A0410E0BA
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 05:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718689157; x=1719293957; i=markus.elfring@web.de;
 bh=Imj8HFamVBfFhq+MAPpqduItpT/fw/LWP4APQ+TZXEo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=am81zZYukuPbpcfKnVzR6iJwAOqTxNy+San1gpx6Kchnbio4EpRAVU7dVclfEHtz
 ruTl9UKJBa8niNwQjpHqqAsgX+DMwVkapteXFvf4+nM6YYeTzCVrps9w2iGM0IqMm
 cMfzPsQjq8O6p6+Lj3PsJhISA8aWtnbIwpF0y/2Qi/oEDgaMJD73HhG2JqR4sF2fw
 Y5QzZtbwsr/VvUD5/VX0pWGlMbbKPeiNI4x0hC7zuyvJXsw9y5UIld//dZAOOnZGF
 Y6PmCQp8JdHYYz9VlTUMBMnaS4NOQmYBeF96jTMHWCFpWRN4r4DTKSAtL6OGXLd0w
 h7r+KVO87w6mkLILMA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTfkd-1rw9zC395h-00IuOt; Tue, 18
 Jun 2024 07:33:47 +0200
Message-ID: <01e68055-cc6e-4756-8376-be6a67d57147@web.de>
Date: Tue, 18 Jun 2024 07:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>
References: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
Subject: Re: [PATCH] drm/nouveau: Use kmemdup_array() instead of kmemdup()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SXNjjJwWZ0CpooJvXJaGmrK+/a+pR0c5MPCgMr8Ia7zScD2A9C1
 8BEQjiOVd7Xjp5nNm9fWK7zcer6uLGho0XnsPEkf/bTk72subJTR2xB2RWza69towSZF/dO
 TDNMVBms3B2YZ6Hm6nU4M//hBMCYKHWEF+EWn9oxfC/WeaA4xVexXc0Y7oLqFkcbyN3uDnF
 LORnyCVj2uPZtXuFwTS1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4GT/I948T7w=;EXwfcDGvpHbG7v9uarDVo9si3mk
 kEle8OCwUvl/+93ad/BRyhZQJRx+A73tbebmM9z6sgNYUSlqpanX1PBeRk6IjS3IapyFdbMIx
 YXtm1r1QnhCSQxpa8J0fZFvkIRUftH+oC7Ncnc4UNDfD2V0M0mqQYddKzUAm4JJdraRYica6d
 pspasWNbdn5NcxIgk2b2SSZxCknloiy2sLvCQ3NH4nhUCOT4djHWhAaB4xG+1LgSmIYFxU1ub
 LpKh07vZONhfDeqwcLnMinf4MXly4+rTadImeYYAAVS7B9EdAP/xTurqvq67160jD4f+9cSAP
 Jb+GYz4BGgX5HAHVd8CSTda1BU2bvQ1ZJv2xC+dHEWG0dQ8cJ0WftAhxpTQ/KSlEWDZmlrze2
 zQfv3dMI8L9xIYLLwRkOhTX5AokoK8tXZxJ0+dp177uE2QUwb8zuwgvoKuCYWoa+do95UTw1R
 +hX7tewHTQr/XXDy42n3OwdZfFvdwKeHGIyqxSl9j0WlOoMMt7s+b6i3VSENCsDdrwAlaUQ4j
 GhCAM700t3qyB9/RdjOlT86oeECUzFgK0WvEowkJIcVygUcHN27I4jdriSapSxoUbaDwt+KnZ
 8gGdQbxPTSwtCB4BaHtVkmS4BzuBSO7eIfOePW28yoQu8Hn7brCESpUds0kOvtdE9RRs9IL0g
 JfEXFsIc3SRq+910JJclihDDhGyr7mb7+DeNH3AjDxdYNGHh0L9w11XumcyFoNwGgEPVErSg2
 FqlP7BlFv9net0rX8py6j1VQujLJLAVxMbDjWFOXZfSLgwT74x+F7PPuH4u1nzT0PEJXA2ALg
 TihVvVSCLTOUXC8qxuAqys5Vzw6JMKw03htrea0MfV6jM=
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

=E2=80=A6
> kmemdup_array() function has integer overflow checking built it. =E2=80=
=A6

                                                         built-in?

Regards,
Markus
