package com.example.labbanco.services;

import com.example.labbanco.PdaProuni2018;
import com.example.labbanco.entities.*;
import com.example.labbanco.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ProuniService {

    private final PdaProuniRepository pdaProuniRepository;
    private final BolsaRepository bolsaRepository;
    private final TipoBolsaRepository tipoBolsaRepository;
    private final InstituicaoEnsinoRepository instituicaoEnsinoRepository;
    private final TurnoCursoRepository turnoCursoRepository;
    private final ModalidadeRepository modalidadeRepository;
    private final SexoRepository sexoRepository;
    private final RacaRepository racaRepository;
    private final MunicipioRepository municipioRepository;
    private final UFRepository ufRepository;
    private final RegiaoRepository regiaoRepository;
    private final CursoRepository cursoRepository;


    @Autowired
    public ProuniService(PdaProuniRepository pdaProuniRepository, BolsaRepository bolsaRepository, TipoBolsaRepository tipoBolsaRepository, InstituicaoEnsinoRepository instituicaoEnsinoRepository, TurnoCursoRepository turnoCursoRepository, ModalidadeRepository modalidadeRepository, SexoRepository sexoRepository, RacaRepository racaRepository, MunicipioRepository municipioRepository, UFRepository ufRepository, RegiaoRepository regiaoRepository, CursoRepository cursoRepository) {
        this.pdaProuniRepository = pdaProuniRepository;
        this.bolsaRepository = bolsaRepository;
        this.tipoBolsaRepository = tipoBolsaRepository;
        this.instituicaoEnsinoRepository = instituicaoEnsinoRepository;
        this.turnoCursoRepository = turnoCursoRepository;
        this.modalidadeRepository = modalidadeRepository;
        this.sexoRepository = sexoRepository;
        this.racaRepository = racaRepository;
        this.municipioRepository = municipioRepository;
        this.ufRepository = ufRepository;
        this.regiaoRepository = regiaoRepository;
        this.cursoRepository = cursoRepository;
    }

    public void distribuiDados()  {

        List<PdaProuni2018> pdaProuni2018List = pdaProuniRepository.findAll();
        ArrayList<Bolsa> bolsas = new ArrayList<>();


        for(PdaProuni2018 pdaProuni2018 : pdaProuni2018List) {
            Bolsa bolsa = new Bolsa();

            bolsa.setAno(pdaProuni2018.getAnoConcessaoBolsa());

            TipoBolsa tipoBolsa = tipoBolsaRepository.findByNome(pdaProuni2018.getTipoBolsa());
            if(tipoBolsa == null) {
                tipoBolsa = new TipoBolsa();
                tipoBolsa.setNome(pdaProuni2018.getTipoBolsa());
                tipoBolsaRepository.save(tipoBolsa);
            }
            bolsa.setTipoBolsa(tipoBolsa);

            InstituicaoEnsino instituicaoEnsino = instituicaoEnsinoRepository.findByNome(pdaProuni2018.getNomeIesBolsa());
            if(instituicaoEnsino == null) {
                instituicaoEnsino = new InstituicaoEnsino();
                instituicaoEnsino.setNome(pdaProuni2018.getNomeIesBolsa());
                instituicaoEnsinoRepository.save(instituicaoEnsino);
            }
            bolsa.setInstituicaoEnsino(instituicaoEnsino);

            Curso curso = cursoRepository.findByNome(pdaProuni2018.getNomeCursoBolsa());
            if(curso == null) {
                curso = new Curso();
                curso.setNome(pdaProuni2018.getNomeCursoBolsa());

                TurnoCurso turnoCurso = turnoCursoRepository.findByNome(pdaProuni2018.getNomeTurnoCursoBolsa());
                if(turnoCurso == null) {
                    turnoCurso = new TurnoCurso();
                    turnoCurso.setNome(pdaProuni2018.getNomeTurnoCursoBolsa());
                    turnoCursoRepository.save(turnoCurso);
                }
                curso.setTurnoCurso(turnoCurso);

                Modalidade modalidade = modalidadeRepository.findByNome(pdaProuni2018.getModalidadeEnsinoBolsa());
                if(modalidade == null) {
                    modalidade = new Modalidade();
                    modalidade.setNome(pdaProuni2018.getModalidadeEnsinoBolsa());
                    modalidadeRepository.save(modalidade);
                }
                curso.setModalidade(modalidade);

                cursoRepository.save(curso);
            }
            bolsa.setCurso(curso);

            Beneficiario beneficiario = new Beneficiario();
            beneficiario.setCpf(pdaProuni2018.getCpfBeneficiarioBolsa());
            beneficiario.setDeficienteFisico(pdaProuni2018.getBeneficiarioDeficienteFisico().contains("S"));

            Sexo sexo = sexoRepository.findByLetra(pdaProuni2018.getSexoBeneficiarioBolsa());
            if(sexo == null) {
                sexo = new Sexo();
                sexo.setLetra(pdaProuni2018.getSexoBeneficiarioBolsa());
                sexoRepository.save(sexo);
            }
            beneficiario.setSexo(sexo);

            Raca raca = racaRepository.findByNome(pdaProuni2018.getRacaBeneficiarioBolsa());
            if(raca == null) {
                raca = new Raca();
                raca.setNome(pdaProuni2018.getRacaBeneficiarioBolsa());
                racaRepository.save(raca);
            }
            beneficiario.setRaca(raca);



            Municipio municipio = municipioRepository.findByNome(pdaProuni2018.getMunicipioBeneficiarioBolsa());
            if(municipio == null) {
                municipio = new Municipio();
                municipio.setNome(pdaProuni2018.getMunicipioBeneficiarioBolsa());

                UF uf = ufRepository.findBySigla(pdaProuni2018.getSiglaUfBeneficiarioBolsa());
                if(uf == null) {
                    uf = new UF();
                    uf.setSigla(pdaProuni2018.getSiglaUfBeneficiarioBolsa());

                    Regiao regiao = regiaoRepository.findByNome(pdaProuni2018.getRegiaoBeneficiarioBolsa());
                    if(regiao == null) {
                        regiao = new Regiao();
                        regiao.setNome(pdaProuni2018.getRegiaoBeneficiarioBolsa());
                        regiaoRepository.save(regiao);
                    }
                    uf.setRegiao(regiao);

                    ufRepository.save(uf);
                }
                municipio.setUf(uf);

                municipioRepository.save(municipio);
            }
            beneficiario.setMunicipio(municipio);


            try {
                String dataNascimento = pdaProuni2018.getDtNascimentoBeneficiario();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date date = sdf.parse(dataNascimento);
                beneficiario.setDataNascimento(date);
            } catch (Exception e) {
                e.printStackTrace();
            }

            bolsa.setBeneficiario(beneficiario);

            bolsas.add(bolsa);
        }
        bolsaRepository.saveAllAndFlush(bolsas);


    }

}
