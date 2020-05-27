Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B949C1E4638
	for <lists+nouveau@lfdr.de>; Wed, 27 May 2020 16:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEE76E314;
	Wed, 27 May 2020 14:41:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Wed, 27 May 2020 14:41:52 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA3E6E314
 for <nouveau@lists.freedesktop.org>; Wed, 27 May 2020 14:41:51 +0000 (UTC)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MMoT4-1jLBph2ppk-00IoHn; Wed, 27 May 2020 16:36:45 +0200
Received: by mail-qt1-f179.google.com with SMTP id h9so9089451qtj.7;
 Wed, 27 May 2020 07:36:45 -0700 (PDT)
X-Gm-Message-State: AOAM5325E12Fvyrw22ECjLbTtpfltQNY9JcRlFJxq3PbDaA9+lmRdRUx
 EwpbKYd9Wrd3elcs3VYASpt3XwPEiI2K1VJzXQU=
X-Google-Smtp-Source: ABdhPJz5OgKXuoYgmUdLE+csUDsEEOEF0XSfC8Ij+VwLLkemZAcY7xiTkXrFOUDNARvgard005IXgUtkM4rz7IvR6EA=
X-Received: by 2002:ac8:691:: with SMTP id f17mr4501313qth.204.1590590204402; 
 Wed, 27 May 2020 07:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134254.854672-1-arnd@arndb.de>
 <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 16:36:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
Message-ID: <CAK8P3a3kRP6Sg-An5szsN=4Pv1OsG+-YQYa1wgxJCi1c+uedPw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Provags-ID: V03:K1:wPLUGXzIU22TEM4rhPoBzP7+pLmG140YzfOjOF0+rTU0/17V0rS
 5xShDckg36/7tAEUPmK7zHPpxlrtHOi7BlvM3XwE79KnEKmKiRHzE7RafdaayUb8gcvJXgo
 F63BMfrvKn1tEdgmZFH+Mm5lYap9oSHv8IafksiPKU6t2z49QBoJfK6d0FIrW+SS2UGgdYv
 exB+XVC208kUgSJFZ6Zjw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K3xGXVNehoo=:TuwDhLG1TKroYB+YO4APnF
 IfvmxkJUnz/t44K8mwvbBLucLnFe3Pqf+SantX3/8E3FNxHgt4zKK3GVkvfku+ke0hHxHXUn5
 meD3s6MDM8dZOUlgeJdmlRIZd8Zx0JV2ScfBFV70XpkCS7JmSt3mtuEr4clyQJZcVIRGLsjXQ
 tEoDi8Z5rZZekTJJy6psgGQoM5hAUw+vuV69Di+Mb1vbnwhWhaWAn9y8tQm1jyN9DbW9/m2g2
 yxZn+qxMhoK++fooPESZm4KjO2rZshpJaBUS0Poh2kzWHYDHYExr6RGPKO4x1eOxgX1NyKC7o
 hJZPLT5ro3GGgAzZlPxoCd5OF8eXMTXnP3T0GgmzBkH+vRoAImZVmNUutgduc3FfmVjbearbC
 3Taq2WKveyXrwt/TgxfAdVlVmweYCFEUX1ak/mkeByTOmxfMtUtQfVKukpE3EmGcuTCpOfIiy
 SdTWQPi09YJgCqlY6vC5qzD4oGGvrkqg3fS+1VtkVaDFaVLkj5wvRj9vL/oLu1tGLrBxBwskP
 dgq+VSwhMmWCmIuXanmRDE7UfMSuik9QyAhUNgi21rU9c85d8Y/Kt1CZ52cXnSZZ1zs0ZV/Jb
 N0tsSqf5o/TzcK4wB/onjj8ztY84a6EOlvU3I8x9eLYAUzW7K4BRpYhpbuUuWA5qIFkH/dlQo
 z92j7VlvLc7/f3mkBan8haiVIxQSgz4s/ZI/sm+br7PTFr1vo0nQJu3gLymnCxANbt0Ys+eWy
 LS0nqtG/C8shhApPYibL5ww4JRYxPylwXsSYpFJi4PNTem1VC6WFnWzS007TG9/OJ0GNEO38N
 nft6eQe5gXld6nzil/GzQTW9J2MHQAGqV1yFNSKQENP0onVd0g=
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 4:05 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Isn't this already fixed by
>
> https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403

Ok, I see that fixes the link error, but I when I created my fix, that did
not seem like the correct solution because it reverts part of the original
patch without reverting the rest of it. Unfortunately there was no
changelog text in the first patch to explain why this is safe.

Could you double-check if the behavior is still correct after the two patches?

      Arnd
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
